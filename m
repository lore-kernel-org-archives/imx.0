Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080043;
	b=P+U4AS4Uq8hrIoSC+zBMkTUIUft2skBiargWdZqyJWzCsyj0sDVjeI4PRJJMVV+gfFXF
	 VrIncyorvAzLg7dC9tX9jMs22+U1yICOtiQjqq4Wu8YNNsZ0sCxWrW1AduQBa0+ppj+Mk
	 kzxl7SyGbAN1GRQRxx+LUS8IDyIX+X24+BF6hi8WhnhqXMd1RSC/vBBGpk4XcOxh+a30c
	 viJOHN0o0pWIZ5aeIrskJxhYB6tTfnte1+0Df5ZML5+3pe3tBDUF+lbypdSAaB3IEh/Pw
	 9C20mXQO1rZM8brJ200VaBElyzXHq7MoRH6nTpxAXhpSy5lS9Z2b8d032RXlXKSJLyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080043;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yTbTZ04gY48kSPjsIM3n3O8wcD9HwYJHskt9MghCK1U=;
	b=4naxdFfyKdLjNmYpZPs9vOn35N4pHRPGsvuwRuV6nGdLt1Pw3RPbJQzVoZPS/AAsH48C
	 hIx2qQxDTUP7+F8GTKeNnmcnX6I/bpY4bsTOWAYMOvpxfBt/mIxS53+E5GcC4yRQuJwPd
	 ngbMBY3w548OA/yrXSImqYLzpbPelea2UIqH1Vpojw6Nk6cAZbkAJ9pAjxTHcy9gD8U6R
	 aVXlJRlKR8S6zrlnEWo3FTA6jAy6/VfidIMedTQCQXhcTK6G8mYrfNcovey+uc5jYggMa
	 yOgCi8rqR+exKBrLqFW449THShrIApZkjXIfK5PbIz4h1VwyUVa9OHDlVkw1gvk0P1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DtutbJnQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020D4606A320;
	Thu, 19 Nov 2026 09:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DtutbJnQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474961F000C4;
	Thu, 19 Nov 2026 09:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795080042;
	bh=yTbTZ04gY48kSPjsIM3n3O8wcD9HwYJHskt9MghCK1U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DtutbJnQGbgju9jhVj67BZSN8Uf2akIZGpYxxyZvMTRN/W1RaEuFVk3QO1qzcjp7z
	 ySFjx7kRq5OqKp1LwNbPZg7mACHN6EsQuG6ddo4KfVH4jHfQhCnLpKveg21Kbzair1
	 UfjMJHyDKCVko/PsAd1FInvXtJ2MbK9x7frDH2QI8/9/Ut6IMxon2OpFQ4m/w2fBnH
	 4JOtHgf3zwGId61Oiw0FisSNguJIdDVdFakIiH+4x1xNWSxkBuvR4EoqolWPU1jtt8
	 TDY5WoyBOSJvvMXN4EjVZ8k+jpZMKuG3qGRaYYVsuB90zHiurDRR/Gqt2gDAR362Qx
	 ISdIKZsdJoPew==
Message-ID: <sashiko-outbox-222815@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 09/11] media: chips-media: wave6: Add performance
 profiling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nas Chung" <nas.chung@chipsnmedia.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <5702baa6ed97eb30dec14bddba2919252ec8f3c8.1795075582.git.nas.chung@chipsnmedia.com>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <5702baa6ed97eb30dec14bddba2919252ec8f3c8.1795075582.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 09:20:41 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [Medium] media: wave6: performance timestamps not re-recorded on
  OUTPUT stream restart
- [Medium] media: wave6: skipped performance reset in
  wave6_vpu_enc_stop_streaming()
- [Medium] media: wave6: wave6_vpu_cycle_to_ns() queries empty
  core->clks instead of vpu
- [Medium] media: wave6: unlocked TOCTOU race and div-by-zero in
  wave6_vpu_dbg_instance()
- [Low] media: wave6: negative setup latency in wave6_vpu_dbg_instance()
  before PIC_RUN
--

commit bc504ce1eb7a7d90813e57f32d70181940592318
Author: Nas Chung <nas.chung@chipsnmedia.com>

media: chips-media: wave6: Add performance profiling

This commit adds per-instance performance profiling to record per-frame
timestamps and firmware cycle counts, reporting frame rates and latencies
in debugfs.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c b/d=
rivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
> index 525e047ecebff..be1061b2b39f0 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
[ ... ]
> @@ -77,6 +83,36 @@ static int wave6_vpu_dbg_instance(struct seq_file *s, =
void *data)
>  		   inst->error_buf_num,
>  		   v4l2_m2m_has_stopped(inst->v4l2_fh.m2m_ctx));
> =20
> +	seq_puts(s, "fps");
> +	tmp =3D MSEC_PER_SEC * inst->processed_buf_num;
> +	if (perf->ts_last > perf->ts_first + NSEC_PER_MSEC) {
> +		duration =3D ktime_ms_delta(perf->ts_last, perf->ts_first);
> +		fps =3D DIV64_U64_ROUND_CLOSEST(tmp, duration);
> +		seq_printf(s, " actual: %lld;", fps);
> +	}

[Severity: Medium]
Can a concurrent OUTPUT queue stop_streaming() cause a divide-by-zero in
DIV64_U64_ROUND_CLOSEST(tmp, duration)?

wave6_vpu_dbg_instance() reads inst->performance without locking while the
debugfs file is active:

CPU0                              CPU1
wave6_vpu_dbg_instance()
  if (perf->ts_last >
      perf->ts_first + NSEC_PER_MSEC)
                                  wave6_vpu_dec_stop_streaming()
                                    wave6_vpu_reset_performance()
                                      memset(&inst->performance, 0, ...)
    duration =3D ktime_ms_delta(
        perf->ts_last, perf->ts_first)
    DIV64_U64_ROUND_CLOSEST(
        tmp, duration)  <-- divide-by-zero when duration =3D=3D 0

Unlike wave6_vpu_reset_performance(), this path does not check duration > 0
before dividing, and if only perf->ts_last is seen zeroed, duration becomes
negative and is cast to a large u64 divisor.

> +	duration =3D div_u64(perf->total_sw_time, NSEC_PER_MSEC);
> +	if (duration > 0) {
> +		fps =3D DIV64_U64_ROUND_CLOSEST(tmp, duration);
> +		seq_printf(s, " sw: %lld;", fps);
> +	}
> +	duration =3D div_u64(perf->total_hw_time, NSEC_PER_MSEC);
> +	if (duration > 0) {
> +		fps =3D DIV64_U64_ROUND_CLOSEST(tmp, duration);
> +		seq_printf(s, " hw: %lld", fps);
> +	}
> +	seq_putc(s, '\n');
> +
> +	ms[0] =3D div_s64_rem(perf->latency_first, NSEC_PER_MSEC, &ns[0]);
> +	ms[1] =3D div_s64_rem(perf->latency_max, NSEC_PER_MSEC, &ns[1]);
> +	ms[2] =3D div_s64_rem(ktime_sub(perf->ts_first, perf->ts_start), NSEC_P=
ER_MSEC, &ns[2]);
> +	seq_printf(s, "latency(ms) first: %lld.%06d, max %lld.%06d, setup %lld.=
%06d\n",
> +		   ms[0], ns[0], ms[1], ns[1], ms[2], ns[2]);

[Severity: Low]
What happens to the setup latency output if the debugfs file is read before
the instance reaches VPU_INST_STATE_PIC_RUN?

perf->ts_start is set when the instance is created (before
wave6_vpu_create_dbgfs_file() exposes the debugfs entry in
VPU_INST_STATE_OPEN), whereas perf->ts_first remains 0 until
wave6_vpu_dec_prepare_fb() or wave6_vpu_enc_prepare_fb() transitions the
instance to VPU_INST_STATE_PIC_RUN.  Reading debugfs in VPU_INST_STATE_OPEN
or VPU_INST_STATE_INIT_SEQ passes -perf->ts_start to div_s64_rem(),
producing a negative quotient ms[2] and a negative remainder ns[2] formatted
with %lld.%06d (e.g. "setup -12345.-678900").

[ ... ]

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c b/d=
rivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
> index 7eab283ec9e70..4fa4371545f9b 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
[ ... ]
> @@ -1670,6 +1684,7 @@ static void wave6_vpu_dec_stop_streaming(struct vb2=
_queue *q)
>  		goto exit;
> =20
>  	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +		wave6_vpu_reset_performance(inst);
>  		inst->queued_src_buf_num =3D 0;
>  		inst->processed_buf_num =3D 0;
>  		inst->error_buf_num =3D 0;

[Severity: Medium]
Does zeroing inst->performance on OUTPUT stop_streaming() leave
perf->ts_start and perf->ts_first at 0 when OUTPUT streaming is restarted?

During a decoder seek (VIDIOC_STREAMOFF followed by VIDIOC_STREAMON on the
OUTPUT queue), wave6_vpu_dec_stop_streaming() clears inst->performance and
moves inst->state to VPU_INST_STATE_SEEK.  When OUTPUT streaming restarts,
wave6_vpu_dec_start_streaming() restores inst->state directly to
inst->state_in_seek without calling wave6_vpu_record_performance_timestamps=
():

drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c:wave6_vpu_dec_star=
t_streaming() {
	...
	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
		fmt =3D &inst->src_fmt;
		if (inst->state =3D=3D VPU_INST_STATE_NONE) {
			ret =3D wave6_vpu_dec_create_instance(inst);
			...
		}
		if (inst->state =3D=3D VPU_INST_STATE_SEEK)
			wave6_vpu_set_instance_state(inst, inst->state_in_seek);
	}
	...
}

The same happens in the encoder when the OUTPUT queue is stopped and
restarted while CAPTURE remains streaming in VPU_INST_STATE_PIC_RUN.
Because perf->ts_first stays 0 while perf->ts_last updates on each decoded
or encoded frame, ktime_ms_delta(perf->ts_last, perf->ts_first) in debugfs
and wave6_vpu_reset_performance() divides by total system uptime since boot.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c b/d=
rivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
> index 4a0739033d1a9..ca2d4051f9adf 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
[ ... ]
> @@ -2363,6 +2375,7 @@ static void wave6_vpu_enc_stop_streaming(struct vb2=
_queue *q)
>  		goto exit;
> =20
>  	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +		wave6_vpu_reset_performance(inst);
>  		inst->queued_src_buf_num =3D 0;
>  		inst->processed_buf_num =3D 0;
>  		inst->error_buf_num =3D 0;

[Severity: Medium]
Is wave6_vpu_reset_performance() skipped whenever the encoder CAPTURE queue
stops streaming before the OUTPUT queue?

In wave6_vpu_enc_stop_streaming(), stopping the CAPTURE queue calls
wave6_vpu_enc_destroy_instance(inst, true), which sets inst->state to
VPU_INST_STATE_NONE.  When wave6_vpu_enc_stop_streaming() is then called for
the OUTPUT queue (for example via v4l2_m2m_ctx_release() on file close,
which always stops CAPTURE before OUTPUT, or via VIDIOC_STREAMOFF on CAPTURE
first), the early check:

	if (inst->state =3D=3D VPU_INST_STATE_NONE)
		goto exit;

bypasses wave6_vpu_reset_performance(inst) and the counter resets.  This
skips logging the performance summary and leaves stale metrics and non-zero
ts_start / ts_first values in inst->performance if streaming is restarted on
the same file descriptor.

> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c b/=
drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
> index 6980b126dee55..3ec01ec867dfc 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
[ ... ]
> @@ -228,6 +231,20 @@ void wave6_vpu_set_instance_state(struct vpu_instanc=
e *inst,
>  	inst->state =3D state;
>  }
> =20
> +u64 wave6_vpu_cycle_to_ns(struct vpu_core_device *core, u64 cycle)
> +{
> +	unsigned long rate;
> +
> +	if (!core->num_clks || !core->clks)
> +		return 0;
> +
> +	rate =3D clk_get_rate(core->clks[0].clk);
> +	if (!rate)
> +		return 0;
> +
> +	return div64_ul(cycle * NSEC_PER_SEC, rate);
> +}

[Severity: Medium]
Does wave6_vpu_cycle_to_ns() always return 0 because the clocks belong to
core->vpu rather than core?

In the Device Tree binding (nxp,imx95-vpu.yaml), the clocks property is on
the parent VPU node and is acquired into vpu->clks by wave6_vpu_probe(),
whereas the child interface nodes used to create the wave6-vpu-core devices
have no clocks property.  As a result, core->num_clks is 0, per-frame
hw_time and perf->total_hw_time remain 0, and hardware FPS is never
reported.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795075577.gi=
t.nas.chung@chipsnmedia.com?part=3D9
