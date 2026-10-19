Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792451559;
	b=oh/I5QjnSFCt4BUv1Qw02H3bktKOmyuy/U7k5UdIieXkP+HF4jhrgNuhWUgf89IOTumN
	 7dLsT5bDw0GLOKmYcNWXHXHrImtIoL91ax1tbrVoda0i+sRc1grOoSG/ZjLWnqrlfGzVs
	 eqdMSnh3h3KizI2+ivQJL1rX2lZ0wu+krv09HH1lyv96BD4eVf6iOt8GzilGV9rxr8LOv
	 0fq3tz5S3HWPr8MQL6eKmSgV+CwQcCkxFp0CSovyjBO7TptRNOfrGKVYDr1vf18bjM2q+
	 80DtO96SyKK2DUyFd4TV5V2Q8KS/xwg+khQXr/sXPfQ1Rsd7Tz/qWAXl5r+TLkcLXkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792451559;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Sbyeg0eCrCPYafk0IrpKxi7/8K1TfJs6Osh4YuxfEaM=;
	b=f+ZvX5EJ2NTeMlTAP0Wga3bHBn/UBeAagqVPBAlfJjI8g93VM336D5xvYQ2k8fCSpN1P
	 tFolpuj6UI/y2xHl7QWrjIPhQQeL5XLc/MaHjlRfv2y7DNk54875d3zGCUxVpRWBJmHC9
	 K64XDUrRWxeJqZ3y+3MHrJ/m5Ob97yoV3jrhqgQeMID6ZuyJP7OvJSs3J+oZVxcCpUiDu
	 YORB2JJ9BrKKtdaYU6bba2ACjZk6uz11koPxnCBK+DgrLPf+QXjBVYxhfkCl5v1Ie6yvT
	 xQdo/4oCL1qLBnOCOGiwKSFwVqDn7hRgFX9kHFkxCgDRXsEkrIuYdaXtQLJpu2tkBXA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qDLVOkIW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73197606A32E
	for <imx@lists.linux.dev>; Mon, 19 Oct 2026 23:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73197606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qDLVOkIW
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5ba357a1929so2688093e87.0
        for <imx@lists.linux.dev>; Mon, 19 Oct 2026 16:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792451557; cv=none;
        d=google.com; s=arc-20260327;
        b=I4nRRpR7bj+8CF4x3KABtGtSDtVSr8SMSduzqqAuf0Q9VKO5WfQqLmEP/rJq3iQJuF
         5TTtqD9MqL4rYXnL/HCROksXEccb4+xZdASVX/f0O+nor9mm4WPob16iXdiU01tpwW+u
         XOxSBWM0OELWl3sh/gxfGP5788zztAdxyaUeY/BfaSfQqGe6+YMDGzthn/qPMS0dYiU/
         Czhs3trV4rGAyZS0gyAgYZJdGIDOunDS7KyQP0e+n7K8mjmriqTc4WMiWZ4msPpNh/a0
         ++Q8UrxdUbe5eeY4A1yhK42eM/BJEpQKYr5rwslGo6YxyUDJvVPyB3LwobtGhh9EJn0c
         iyAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sbyeg0eCrCPYafk0IrpKxi7/8K1TfJs6Osh4YuxfEaM=;
        fh=NQxs/5I53H4b/tl+blmBURcsQh5lBqTdEJpEIQpKfqo=;
        b=kyJ5hQTt4lGyT4tr/q392pWK0GxXg+1WJ9Ak4/lEGyZqKdNVeGf6kdqQY/i6/3bAxy
         SmBwP6JH8l9ovscHAgag9u3eMyhvdbnVd2+iUY17emldCZ5bEqVzmNTjzRQKh5qkjD5n
         yfpU2GinaEoH3O/hk2vZ1Qd/VW2Ddea8emFiMt23HhmTeycXfQZTB7dQ01TqXlz6vkTX
         wDzm2S+k2yXk0Gg0a5F1z2AqBAXC/BPA9NP6Yn3b3co28kGoua3VV+mMPSEIibwU6dPf
         //xK+zkppdo9E/J0zsDBdA8lIi0DH+ghNpzBz1WpPQX3z7XES8pozE4MEXNWp1KF9Nyz
         ryhg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792451557; x=1793056357; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sbyeg0eCrCPYafk0IrpKxi7/8K1TfJs6Osh4YuxfEaM=;
        b=qDLVOkIWlSZZGJPfhcvN46U4UtiLe1dvJwFRJHxKJMJo2ZfQN34qhgQBFjMcvCwNDr
         Nih6ux4Au2GYfIYLdyxjguLxqC5xDH1Sr37zduvajgmr9dSIbq1hbbDLUe+WXnKn4tV+
         rUujcti8tHlNXooPrEos0ji4o6lwHzfSK86MspDhFpsJ7wtcW46yHZYLgipJQAwOr4t1
         dOA2S48aEYxoK+iH2f8anZ0fxaTr3IKqy5aPV6OQKdKw+nQSpUKyCt5BGZKHVD31ZB74
         eLAc7OyQH+i6y69aA5/o4KfPIVV18yVPDQz7GgvFKHIr5BJMiHusCq8zqkbQm6a3V/5e
         C7Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792451557; x=1793056357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sbyeg0eCrCPYafk0IrpKxi7/8K1TfJs6Osh4YuxfEaM=;
        b=ndmTp3yV3K0CCCx1UntC1C3rSnk2Gm3dTR5INO64a8ZafVoIZsUle6apAHjdJTVxeG
         kUTDTCTQnm4S7MbYBiQ+t2V0bsTmEQvs/5WqCINOkb5kJDxR+lV+C/eGthWT/a56uwLO
         B9FZF/1Dr4B85UZByRYlYBpFmz7baLC2firYZrSbZ8wtU6T/swhh/o6mcP8dwfSp3fvS
         /V7kZMYa3Os7tDSWLovBGQJLhZOYWU6FU5FxOvhWFUv+qXFSA2HHuEWUQGEMTHB9RX7e
         KHV5yoh2EYiGysicdXeY68nQZLGV5D2z535+EG8520Lzcqj8KaIxsulfT/TBsQZZjw1D
         L2Pw==
X-Forwarded-Encrypted: i=1; AKwUvByuAGKyIEwygpYLcvhtm2kEv8CBxiz1cCrd3/9rQCC7l3XWaQ/Q7keoT+k26WVefPTwZ2s=@lists.linux.dev
X-Gm-Message-State: AFq9FYJRB0UXapxvpv+no9RK+lS1pWzob+qnZ45NPisEMa0guEfTniju
	cEPm1nu3BOkler7vcyaOsRb4l0IN5GUmRFrN0PBfshllJqt6ekqIWGKIDBn4FwA0W8IX4cnD/72
	/d+4lhM2ZshnC+lTvM1cQBmEUhefXfOE=
X-Gm-Gg: AYBFou1uROjJFG3xmnrPPCVgJhKTHr1EnRU8KKStHVIpfncSTjgh1mh2tFaN2QZcigu
	UMZ3bwfB/k42e4pPKT99u1seUUUPwW8xdAngdRDsIkBZ9pAibEoJle3Z/7LkD5aA7G9+rZ7uzyo
	FvYOUlO7j1khSsXGdSVtGlHiuhjFxWCjfoWh0gcZDk4v4UDD2ywLp1nNWmxgST0CR9Zoj8MqLX7
	Jlw8sJtPWxUymAJeZ2FlDCg5m4NARVyWiSa4UbTrejtTUfxZIDKw5gjNmq2V5XfO/QSqBZS3H6a
	PIKYBhcaNO3ceYg2HWaBTmFfOU8vz8zswRD3wArtF839SCGlzq34O9Es9ANHC01grc0w26D30Sk
	owqyElIN/GzglVBLvwxv8lha70eaTjwlLcaUifd25UvQg
X-Received: by 2002:a05:6512:32cb:b0:5be:559d:97d3 with SMTP id
 2adb3069b0e04-5be559d9e2bmr2279941e87.25.1792451557299; Mon, 19 Oct 2026
 16:12:37 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com>
In-Reply-To: <20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 19 Oct 2026 20:12:26 -0300
X-Gm-Features: AclHuK_sIDCnoT7p4C2M3ArcMmF6PmO_wm6FePSRnR_5IzyNWFoOjbw4PWCxo2c
Message-ID: <CAOMZO5D1XDc7C6H9jYTtpiPah3DnQxJz35t+3k0--a072KsMuA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: Use of_device_id match table for per-SoC data
To: joy.zou@oss.nxp.com
Cc: Peng Fan <peng.fan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joy Zou <joy.zou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 8:05=E2=80=AFAM <joy.zou@oss.nxp.com> wrote:

> +       if (!pmx->data) {
> +               dev_err(pctldev->dev, "platform does not support scmi pin=
ctrl\n");
> +               return -EINVAL;

This NULL check seems redundant as pmx->data has already been NULL
checked in probe().

> +       pmx->data =3D of_machine_get_match_data(scmi_pinctrl_imx_data);
> +       if (!pmx->data)
> +               return -ENODEV;

Can this be NULL? If there is no match, the driver would not be probed.
