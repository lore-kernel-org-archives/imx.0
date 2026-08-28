Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E50200110
	for <imx@lists.linux.dev>; Fri, 28 Aug 2026 05:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787895347; cv=none; b=eHqV++V6pY+7TNbh1PT0uwdZqgxP0NB6GHq5V94Ykw29i8UIw4i7US4WS5r3Ihd3LyRIgzfFoE4z7OvfAQD6Z3Mjb8xIpXpOApzjMGp685foJponbXjTJSLwYiEljldfX2OzFAXYC/C64d7LGRS+ss4k9CjqQpEB6xMUzMlIGB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787895347; c=relaxed/simple;
	bh=C9HWFbTJ5a3RytJIdO3ryUw66MsO7UNIcph+30YX+hs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ClYbGLlGOB/X0L36VijGoGjihWbSpVWFY1sdIGw9TWKkWpq5S2ga5kkiRnn9tJctASmBx8RARn8ZNZwpxMsqSXTy+JWLoxYJoy54Ga7tWjFtGGh+Q3cFLk26BPkg60rbFdU/KyC1dfHbrqXlQgqxMqaNxeJrVGqBxWioElmPNkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ImN2IbT8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ImN2IbT8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DC3F1F000E9;
	Fri, 28 Aug 2026 05:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787895345;
	bh=Oz5lY8w9f2+x7jVn9G4QLERYkMGaJILCsdzyarPoAmA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ImN2IbT82AWvjLdmOCgAApBog3gBpzWzR6yvnB6ruZv+TW1UXX0G/ZVd/RDNW12ZV
	 oa147/qr7bJrtR6WCNEEovbGlBtqw45kOzkEqEPdBnxtWuqeM6wrU6zwtE79CsEbYv
	 qnARRREUx/0Hh0ISAtKxZqxd8qYJaWKesJjgroEBasRYCir1z4rlho9zxvL6Z4ORh8
	 KEc8/MKNZNXcb6Jnh1ftv1M1G9giJInALXUiJmD+ep164nsHfCrNPIbcA9KDNbnx2w
	 31oVz/kQmDQAL6+rHW+/zXOXsKve0qGCHbcObHOCtVa7hKb7VFywEQa7kKfCQl1lIM
	 Jl9yKdt460Blg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: imx-jpeg: Cancel timeout work on release
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kazuki Hanai" <hnkz.64@gmail.com>
Cc: Frank.Li@kernel.org, media-ci@linuxtv.org, imx@lists.linux.dev
In-Reply-To: <20260828051452.1940559-1-hnkz.64@gmail.com>
References: <20260828051452.1940559-1-hnkz.64@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 05:35:44 +0000
Message-Id: <20260828053545.0DC3F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Concurrent execution of `v4l2_m2m_ctx_release()` and `v4l2_m2m_job=
_finish()` causes a use-after-free of `m2m_ctx`.
- [High] Race condition in `mxc_jpeg_device_run_timeout()` causes a NULL po=
inter dereference if it executes after its context's job finishes and anoth=
er context starts.
--

commit ba4456d4cd6b4b2046f0bf363757a56e4661b019
Author: Kazuki Hanai <hnkz.64@gmail.com>

media: imx-jpeg: Cancel timeout work on release

This commit adds a synchronous cancellation of the timeout work during
device release to prevent a use-after-free. It places the cancellation
after the mem2mem context release.

> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/med=
ia/platform/nxp/imx-jpeg/mxc-jpeg.c
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -2805,6 +2805,7 @@ static int mxc_jpeg_release(struct file *file)
>  			ctx->slot);
>  	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
> +	cancel_delayed_work_sync(&ctx->task_timer);

[Severity: High]
This is a pre-existing issue, but does placing the sync cancel after
the mem2mem release still leave a use-after-free window?

If mxc_jpeg_release() calls v4l2_m2m_ctx_release(), it blocks in
v4l2_m2m_cancel_job() waiting for the hung hardware job to finish.

Concurrently, the timeout work mxc_jpeg_device_run_timeout() can
execute and call v4l2_m2m_job_finish(). Inside v4l2_m2m_job_finish(),
the job is marked finished and the wait queue is woken up, which
unblocks v4l2_m2m_ctx_release().

The release function then immediately frees m2m_ctx.

Meanwhile, v4l2_m2m_job_finish() continues on the timeout thread,
checks schedule_next, and calls v4l2_m2m_schedule_next_job(m2m_dev, m2m_ctx=
).
Will this access the newly freed m2m_ctx?

[Severity: High]
This is also a pre-existing issue, but since we are dealing with the
timeout work cancellation, is there a race condition in
mxc_jpeg_device_run_timeout() that can cause a NULL pointer dereference?

If a job for Context A finishes successfully, the IRQ handler
mxc_jpeg_dec_irq() calls cancel_delayed_work() (which is not synchronous).
If Context A's delayed work has already started executing but was preempted
before acquiring hw_lock, cancel_delayed_work() returns without stopping it.

The IRQ handler schedules the next job for Context B, which acquires hw_lock
and sets ctx->mxc_jpeg->slot_data.used =3D true.

Context A's timeout work then resumes, acquires hw_lock, and incorrectly
observes the globally shared slot_data.used as true. Assuming it timed out,
it calls mxc_jpeg_job_finish(ctxA, ...).

Since Context A has no active job, v4l2_m2m_next_src_buf() returns NULL.
When mxc_jpeg_job_finish() passes this NULL pointer to v4l2_m2m_buf_done(),
will it cause an unconditional dereference in vb2_buffer_done()?

>  	v4l2_fh_del(&ctx->fh, file);
>  	v4l2_fh_exit(&ctx->fh);
>  	kfree(ctx);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828051452.1940=
559-1-hnkz.64@gmail.com?part=3D1
