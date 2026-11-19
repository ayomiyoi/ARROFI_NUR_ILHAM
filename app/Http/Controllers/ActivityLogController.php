<?php

namespace App\Http\Controllers;

use App\Models\ActivityLog;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\View\View;

class ActivityLogController extends Controller
{
    public function index(Request $request): View
    {
        $this->cekRole('admin');

        $query = ActivityLog::with('user');

        if ($request->query('action')) {
            $query->where('action', $request->query('action'));
        }

        if ($request->query('user_id')) {
            $query->where('user_id', $request->query('user_id'));
        }

        if ($request->query('tanggal')) {
            $query->whereDate('created_at', $request->query('tanggal'));
        }

        if ($request->query('q')) {
            $query->where('description', 'like', '%'.$request->query('q').'%');
        }

        $logs = $query->orderByDesc('id')->paginate(15)->withQueryString();

        return view('activity-logs.index', [
            'logs' => $logs,
            'aksiDipilih' => $request->query('action'),
            'userDipilih' => $request->query('user_id'),
            'tanggalDipilih' => $request->query('tanggal'),
            'cari' => $request->query('q'),
            'users' => User::orderBy('name')->get(),
        ]);
    }
}
