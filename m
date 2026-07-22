Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2160133EB1A
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 06:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784700673; cv=pass; b=jKt4a/cihXg8uTJuW/HVpk6IWph2q/2dXy7KaeyKklsEZm5lC1ddDmkGiDPSZJbJt+GpTId97hx9uDuRkkPGRJegFNV8kWCCh+W1ukzaYwdDBRjJuzFILcap2WtjhV44hIFcEMA5Ma4tW5EJf1odXJavR3OtQhAhV/PJ0gyZ0o4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784700673; c=relaxed/simple;
	bh=OkMxB1ADgZoX24fSd2GYMMEAXbeVXA9oKqgABoNYoMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioFIYqx1KIpf36IV3UT8GVntGQBvy4fX8E90pUBb6liw8E4Uu494rtcnuc/hs2F1jVP8vq76mqokRxKyEZR6Fs//jIjY3F/ZKu5Ra9Li/14LsdxdL96oC946+eUoSusplR7KfMUpukgMg4E3BNvkpND7UtoQxaKLPyzOSOx7w9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mechasystems.com; spf=pass smtp.mailfrom=mechasystems.com; dkim=pass (2048-bit key) header.d=mechasystems.com header.i=@mechasystems.com header.b=YnXuVEYe; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mechasystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mechasystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mechasystems.com header.i=@mechasystems.com header.b="YnXuVEYe"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so8740128a12.1
        for <imx@lists.linux.dev>; Tue, 21 Jul 2026 23:11:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784700671; cv=none;
        d=google.com; s=arc-20260327;
        b=BJN5C6JVeQNt07DABMNVLEw+ZWaXS+1WnqrvF76q9jooKukzPjCWvtdsoxc7afIfJt
         zc80WCDYJKeHW2WEQDjx1mbfQaH25mIXiTfegikylUpvWAeLwAZW5CumtVJXTdTHBnHC
         COs5J3203qTwEuGkYwx6mxd/QRQtcTdUqEdXm5qGN7bh8JDl1yUUQDNxF2m/myt4WNkp
         Eh2m9LbG7EX3gUpEO7BCf3t0BU3hQWE54VzHWzSVtxX0Ij6mGm/Xo7ncLq/pMavInxQ1
         2eEFSUx1x7MBic8djDR+Bw4uM/WTS1koZcvHjQQpZ+oxL8gYX75bhTtgFZL+O331U72H
         Lg1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OkMxB1ADgZoX24fSd2GYMMEAXbeVXA9oKqgABoNYoMs=;
        fh=2b/W7uAuQ6TFQBPULORE6N2zvkxP8j3zqnmeveY0/Ww=;
        b=CO8Q0Wk3ykkVvXWpkt1Z4cBb6rHdcWuYDQ74CzL/LDX4n0ecAHfZEopD1R1lslxn9y
         6HXzDDtox3a8X2Pig2zNjDNzMTgPO+Ual98ri9WaVqqGY4pv0avHslEVsBBZM5IAzthi
         3OvcG/fNYobLCkeRmd7IvOqdjHh7j11JWQHgO6uZjhId0DByiG5L+MFVttW3fqp5W4l6
         dDzziwmoKwAUXFLerbokYLrOrBkfLC2Lnv+ymqa89xobsrYOvmxnpd2dPqMrdhRWpC/w
         aSAiolwWfCyppwKzFfY16hWK4IvHVVYysddoUCBDr++KLhByX2YrTZIG6E/L+Fuk3i36
         om1Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mechasystems.com; s=google; t=1784700671; x=1785305471; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OkMxB1ADgZoX24fSd2GYMMEAXbeVXA9oKqgABoNYoMs=;
        b=YnXuVEYe2+1PM2A8b00SOeD1wB+j2ET3R5H9AkZiktQtcChDr9gUWNeyiDL0IrHLok
         F+I4nSub9yelVTLIXspMiTDMLKPO61xLt3aGNP4ni/UEOkn0PvkDFtK8G3NxuYfL4MmJ
         CD23eUfRNdkhLZLhz42E6pn33kCW8g1lYzTXmZiXx+bqYdgda7aSeDbGI9g77GhKrQ7A
         j9sXzrmmAqMNWZW9m7CCwZquegq9EZHeRTQxZ6p6aRMcA56FOMr7ZyYF0vGy6lRytkT3
         wUC7cprfSh4R7Ml7CRV8JHX6f0A3BGVMS1T9u3ZdTXjVGlh1r767nGvNWPyZFVmW7oWC
         nDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784700671; x=1785305471;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OkMxB1ADgZoX24fSd2GYMMEAXbeVXA9oKqgABoNYoMs=;
        b=KCk3I9Q0w3ChAFzhAsRWblQHqLcEBa7cGrqIkrjkrNyEMtrpBmVXkuDw2px7wQTWcl
         yfXDaEdZmg9p3HwLZdyrlmNyA7g0cBLQ7bQTTmAlCPB2AR7KmU7lnVu8kQESh3FL6yrT
         L/WfX1GqFZJbbQPKagdw3TN6EtCRxftHZiXaWit1zXDjd3XuTV2q4RsQAGqu/P/LpLWP
         scQ2WpScQEAx/JuhGqFMQ1cC5vc9TpsAqkoldHgp59T5+p/waG/CfAjRcESfk0p9yz4P
         xbnNNVs1fvsewN7BpES38oWo/COSklmbRVmDXxecQuXVDvGcbB88nbQVDH/1L4ayjjbT
         6GHg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7EN/YqksgvSlIRo7xUOrhWgvsWxTblQs+sdNwfXDO3MIx2FV3hhGjsEwd4AgpJ8C/sI4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz30+hrhMAbe4E/kLtVcAC0sXlKS9FAyEOiUIkI3ZCGukhWhZYV
	Je/7Ep8yPnTFAZpoTbavdEBGtj8DsS4WwWbyvyDVbfqu0gthdQq+SmKpjBcqW/41OEmBW06hLTk
	R5q0IRej4w9f3Vo7bgq+Xt4hdWdk7sR/Q/AsuG7udvQ==
X-Gm-Gg: AR+sD11lsGgiYwTairguEwWNh+vKTd/xNyHa8scgPAkWkYerapnvaXyPKoKdF9f9ufA
	XNPRR47zev85Ase2g5wIdlCuD1Jzw7WHSPCZA7DQ5S651AJP6yPduKJaD7uG8jCted3ljDro+hr
	Erph6ro1h2bP/UilhDDEzt6WZIRfrhgFXJM38o+WfgNFijVZ5S26Ma9InJ1NQhT5OZhnjJnRkfK
	xA8bhmROZVDI+t058Qs2ZCS2Tck1p/CSt4s5+vracr/BqGsfn2eymaQXMAR1jM=
X-Received: by 2002:a05:6a21:1f81:b0:3b2:8685:118b with SMTP id
 adf61e73a8af0-3c3ad66b6f7mr24333720637.20.1784700671391; Tue, 21 Jul 2026
 23:11:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAAPs2HTo=4+AEw1+vcU6c9vt_O2BfF+gv3FFvx9G3KLLzCOsHw@mail.gmail.com>
In-Reply-To: <CAAPs2HTo=4+AEw1+vcU6c9vt_O2BfF+gv3FFvx9G3KLLzCOsHw@mail.gmail.com>
From: Advait Dhamorikar <advaitd@mechasystems.com>
Date: Wed, 22 Jul 2026 11:40:59 +0530
X-Gm-Features: AUfX_mwknoj-Deg8-Dcg-e3PqQ1pi3R_hwflRITqu0EFCqpynuUYicNGSZbPQgo
Message-ID: <CAAPs2HQcHpDGqhiBXSLOKmXWGevmWbGO3UtfV1pmoiF+wC6aLg@mail.gmail.com>
Subject: Re: pmdomain: imx8m[p]-blk-ctrl: resume hangs when waking from
 suspended state
To: linux-pm@vger.kernel.org, imx@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, ulfh@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	bhushan.shah@machinesoul.in
Content-Type: text/plain; charset="UTF-8"

Another observation I have is that if I disable the MIPI-CSI related
nodes(MIPI-CSI, ISP, ISI), HDMI and VPU nodes from the DTS, or else
unbind their respective drivers before suspending, the suspend
wake sequence works just fine.

Could this indicate that the issue is related to the media clocks or the PHY
during the suspend/resume sequence?

Best Regards,
Advait
