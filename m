Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795443077;
	b=MNItbHgblFpBjKlcypMzXoY58zz9rPP9yCRtG4Rsm6E+QiSxRDclO7SSEp7WMVIbjrJg
	 /wzstBt3pvZk/fez//FOEwn819wrfDNwnTY7BJkplQZWqzVsuZ0bIR8esiOEbmMJfNdON
	 bfze01P86dClVxr2oifNvaXD9AL1SEcEdrPtau2RB27R/kmVoffdU0jI3loy/ZFvjKdrt
	 0Xlf/2q+Zlb8ZO7oi+pOEqpcQdcIyhFYAJoZjdIF37eNH77fwJQ9f5NFmGfQSi6M2D+Ub
	 pa2U0FHSYKfBqmkVBmhA+KBY7AAkCpEBVwZICKoBFDGGomk335IZtAxYJScw/yexwOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=R32xhf3Kvq/DaeS/L7g8lPdJxhRkFnoaSwXaedjNBvc=;
	b=m8MvqSJJEN05Dl+EoBTjyP4uOHAX1rJJ9tHTzG6iiA2Sx/Dcwex6ei95FjkYgCvpHSwA
	 VJK5l7FGJQ62ZWbP+pRK/yOeC+nwceiRccUF/lpDJsufYM/keJPQhbKFYRtCIzMcErtIX
	 9GD1ZGrOFOOyNkg27/znxbM08pRY/lfBlrfVHBVUzaW4Z2zcUP36H57ouMRHPEQ4LIqQW
	 qIpyiWtvPMolCx+Yd5f3ESgTy0FZW4DhGHogLiF14wQI52yGLiW4yucWnzjCbxNPo8Ebh
	 wK0/GuTBtJOClrmQ1cIzXuRHbMloV8673DGJFQMUKmnrf6iM9H6YO8xp9c/6W6t+qpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EihV0rKH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93461606A321
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 14:11:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93461606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EihV0rKH
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b10d24345dso29102767b3.3
        for <imx@lists.linux.dev>; Mon, 23 Nov 2026 06:11:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795443075; cv=none;
        d=google.com; s=arc-20260327;
        b=FqTSNqOBen232mZYGCzJJY0NTHhDipMtGVU4mqpfLf9rXuMOswtehylhky6qOGZG/X
         FWPCCNw9adebLtzPBGZkbkiQqtX8vL7C3EU5RleE1hZoVr2sYD3KG5tSiF56niL5ISxf
         IubcVrq8tW/Ld9SEHgLDLOQpactxNTzChPTAi++wL2suzjFnfuRv3HI0H3C/q2viYsYp
         yQBgXJUxyuvNNRfn8eHefCnOgcqoeVrYjyqrCgKT8zFYbYVtyCC9ry4uHR0aHcTiiO4N
         X2l++wj6g8RW2dKz/oc3zRO5+Ee5bNSiE60lHXGaClYyZkYAvXsdmNNt0pjCDSEKdbvu
         czzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=R32xhf3Kvq/DaeS/L7g8lPdJxhRkFnoaSwXaedjNBvc=;
        fh=NP4393GKkmrWjVeM9RytoSzEezzdxGSgnHcBOxkzdLQ=;
        b=NvhdZ1ETDkGFmH0sW3YATVpJjrVYPkdsRyUSGjT/JxZjDGXwNFFJ34Ie0KoEWNSu5F
         8LNQxV30xCCVcl9cDw/1+/VJFgB72ofSKMe4rLz2m8OcwsbSNuHSybZzhvLx2v5eXdsz
         qD95RUNdvY9xNroThy/LxYtyHMGekhKDkQ+/SJvq2R+9S6s4FAem9jMRswKvGHcdFcWl
         zlrNnjypIbPQ23tM+1L7QX35RVz9UGxcujQiqo6b3LIXDTxa/qfm8f2CXLKjjbhMlCnK
         kkqk8Emz+JrynP6OGOpx9XuLiHDcaHKcGbIiXn9LQme7s/Pg5OiI3Oya3dCFUnsoHKZF
         hPQg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795443075; x=1796047875; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R32xhf3Kvq/DaeS/L7g8lPdJxhRkFnoaSwXaedjNBvc=;
        b=EihV0rKHBeOhf5sj74IjXKTBNuY9+AVoasoKobHjh0/FWNwRWCg1gn6iw3cQInURk8
         sboRcGWTExOxmcdUZXqDk9le59+BasVaxF1XxKyUq4I9ycmmpzUUTQIzo++50FX+AO1D
         aMtcamRg3TxFSnDqf6Vyj8FcgSvfiBw44HCqg0obAyl5fwrHkYHcun1VRgAny0nV5/PD
         R2YP5rJmUvK9wOwAhMME16AYCgV0/E3op0/s/0q7McXBNxQhB8NjzoQwumzd2s6zXYlF
         HJv0IsvLfJz8mqMDh+GAc45DQmD7M3cR8bx9doQ7O+xPR1nAI83JIEoDf/mi7CJWQbbc
         qXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443075; x=1796047875;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=R32xhf3Kvq/DaeS/L7g8lPdJxhRkFnoaSwXaedjNBvc=;
        b=FpGT/rEU6fd+n4KV1rY5ivNA5WmPzlxeFjbieCkW6uwTiA1OIxW9xEvn0fNC6FE3gO
         Qp1zgUNia6MMP+Bv/3PDNxz/HQsjK837M604lbXwAuFc9ivvy7dy/1VPu4PcSSSYIC7y
         IvfbwF+9HckKnDsUUzuxjg1jyX68TL8NuJk02W546nIL6IBuZ5FoVBvFv9ZcvgOd/OYK
         r3kO7gBDAaSdbbeCO2fdEm6qeDmJWTQPLQQsEQajxnlUktweQkY3G1owptBfHdIHUvzW
         q6LYpv4TpKGlB8535SXotUleubFRBaxew2KNdztyg93lXmiKdh7OWhIGh4vwQ6HNJ5xd
         VNqQ==
X-Forwarded-Encrypted: i=1; AL+hErF8bizsj1JlINF7wDdic5nwxclWFEEH2dUkntRKGG+jz08Wp9GpS7jHj3F7IfH6GBDyblI=@lists.linux.dev
X-Gm-Message-State: APuU4Z/gzP/aAGxUW0yRhfoxSoGBMb+3BSzZnTwiwDD/5IImc18YU9H9
	XFdQ/dasKkVjMIR9at3mTrRuDgdXyd1W2swSRiq37pBBqb9+OidKlpOENUFzlUdbVRb6K5Zmtaq
	d0z2ftwX431jrtKqkPsqcYaxKWkZkw4oY6rBLEUzygQ==
X-Gm-Gg: AZFdTZc/ZlDvlOxdwG++QkKm8WKYS7jEtjb+Wlli6b06Vc8QxWLCazPiIMExUzdJpvQ
	+hdY1oWPS+NVy67a5Xp/0RiIpKbYpvu4NIa86aHvndTiLksaTAB3qjaE3V4+HKOGbzWviuhKE9w
	Ejz2EeLjelnxMcMeDtXHubBp2k9OEk+u3MC7WRcS4/aQzml85LDQPTBmp72qqNT5YgWm8idS6r/
	fAGP4ETh9t3RhfPoZbgaMav++7XfG1JTBxv87xWdIBnnjcxshSoBNa/AgMl0TBYDQv6V+qgIldw
	ucoAz90BCKkM8N/CebirBZxLPL8yLWk8xyGb9npdZhoIQg+4sBykCmOnVQ3TrFnHTwD7Emtieps
	FAvNVXl2EPhqSnrjoNXEZstyL1IPWkSGbU0TVwl4BcU7f7vpVPtxmpDzV4fFnO2ngQ+QMjRg=
X-Received: by 2002:a05:690c:6b07:b0:8b5:61d:f3ff with SMTP id
 00721157ae682-8b5204e9571mr53022067b3.46.1795443075492; Mon, 23 Nov 2026
 06:11:15 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110-imx-rproc-free-mbox-v1-1-3e33ff98570d@linux.dev>
 <avMgJNyGez2Eyr3a@nxa18884-linux-1.ap.freescale.net> <awPmc_4VFkcpW0C_@bombadil>
In-Reply-To: <awPmc_4VFkcpW0C_@bombadil>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 23 Nov 2026 08:11:04 -0600
X-Gm-Features: Aa3M54rmzuqQaag6_hKersoZSWqoaB26gF7bb-M07qfK52BJ_PrHvuWnVFcXIfA
Message-ID: <CANLsYkx=M_TXN10qAcQC0be065TYnzfOae6E8ss-9DTj9MzogA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: revert channel freeing order in imx_rproc_free_mbox
To: Richard Leitner <richard.leitner@linux.dev>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	weinshec@holodeck2.de, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Nov 2026 at 01:09, Richard Leitner <richard.leitner@linux.dev> wrote:
>
> On Tue, Nov 10, 2026 at 09:46:12PM +0800, Peng Fan wrote:
> > On Tue, Nov 10, 2026 at 01:29:08PM +0100, Richard Leitner wrote:
> > >The imx_rproc driver is affected by a race condition in the shutdown
> > >ordering in imx_rproc_free_mbox(). A received message might cause a
> > >virtqueue_kick resulting in tx_ch access. When imx_rproc_free_mbox() is
> > >triggered between the if (!priv->tx_ch) check and the mbox_send_message()
> > >call in the imx_rproc_kick() function the mbox_send_message() then tries
> > >to dereference a NULL pointer on the tx_ch (as seen in the call trace
> > >below).
> > >
> > >Therefore fix this behaviour by first freeing the rx channel, so no new
> > >messages are received and therefore no kicking on tx_ch can happen.
> > >Afterwards release the tx channel.
> > >
> > >This problem was encountered on a fleet of i.MX8MP devices on about 1 in
> > >500 system shutdowns, resulting in Oops below. This Oops was recorded
> > >from a v7.3.0 kernel before the work-queue removal.
> > >
> > >    remoteproc remoteproc0: stopped remote processor imx8mp-cm7
> > >    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
> > >    Internal error: Oops: 0000000096000004 [#1]  SMP
> > >    CPU: 0 UID: 0 PID: 32710 Comm: kworker/0:1 Not tainted 7.3.0-XXX #1 PREEMPT
> > >    Hardware name: XXX (DT)
> > >    Workqueue: imx8mp-cm7 imx_rproc_vq_work [imx_rproc]
> > >    pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > >    pc : mbox_send_message+0x8c/0x178
> > >    lr : mbox_send_message+0x88/0x178
> > >    sp : ffff8000897f3b70
> > >    x29: ffff8000897f3b70 x28: ffff80007a07b248 x27: ffff0000d90e1a20
> > >    x26: ffff80007a07b328 x25: ffff0000c1d31300 x24: ffff0000d90e1a40
> > >    x23: 0000000000000001 x22: 0000000000000005 x21: ffff8000897f3ba4
> > >    x20: 000000000000000b x19: ffff0000c1b24240 x18: 0000000000000000
> > >    x17: ffff80006a453000 x16: ffff800081ac8000 x15: 0000000000000000
> > >    x14: 0000000000000040 x13: 0000000000000228 x12: ffff0000c115a3e8
> > >    x11: 0000000000000000 x10: 0000000000000001 x9 : ffff800080cd6570
> > >    x8 : ffff8000897f3ba0 x7 : 0000000000000002 x6 : 0000000000000000
> > >    x5 : 000000000000000c x4 : 0000000004400000 x3 : 0000000000000000
> > >    x2 : 0000000000000000 x1 : ffff0000cb268000 x0 : 0000000000000000
> > >    Call trace:
> > >     mbox_send_message+0x8c/0x178 (P)
> > >     imx_rproc_kick+0x50/0xc0 [imx_rproc]
> > >     rproc_virtio_notify+0x3c/0xa0
> > >     virtqueue_kick+0x4c/0x68
> > >     rpmsg_recv_done+0x224/0x658 [virtio_rpmsg_bus]
> > >     vring_interrupt+0xbc/0x158
> > >     rproc_vq_interrupt+0x40/0xb0
> > >     imx_rproc_notified_idr_cb+0x20/0x40 [imx_rproc]
> > >     idr_for_each+0x74/0x100
> > >     imx_rproc_vq_work+0x2c/0x40 [imx_rproc]
> > >     process_one_work+0x194/0x520
> > >     worker_thread+0x19c/0x320
> > >     kthread+0x134/0x148
> > >     ret_from_fork+0x10/0x20
> > >    Code: 37f80574 aa1303e0 97ffff39 f9400a60 (39402001)
> > >
> > >Fixes: 99b142cf7191 ("remoteproc: imx_rproc: Request mbox channel later")
> > >Cc: stable@vger.kernel.org
> > >Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> >
> > LGTM:
> >
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> >
> > BTW: would you plan to fix the other issue that sashiko reported
> > regarding imx_rproc_xtr_mbox_init()?
>
> Thanks for the review and sorry for the late reply.
>
> Sure. Should this be a separate patch or added to a v2 of this series?
>

Please send another revision with the fix.

> regards;rl
>
> >
> > Regards
> > Peng
