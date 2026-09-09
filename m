Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9958A46EF92
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 08:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941324; cv=none; b=Dlqsoo4zQqi3AJneybTGV1qurLZ0G96/y3P1rtt1TR4MA6ssqvQeSN9vduGkoa+JczyTTSdrKTUlU+Ec0pp26qDTBNtzvD6DHC0QSG91+TpIH2ZUsWNrZ2dyknuKeC8LsFadrQvWh2FEcEP2fRAtj2X3OjLQjkAnWVS6EJ0ZwsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941324; c=relaxed/simple;
	bh=R2je63BbknUokaDi3WpiVqNteUMA8vRZHwmgqRUZSpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EW2m476DjnI2jCD9GjQz/tCVB6UGQrT9b6g+qajTrEzavKOu67hvwby2Due/4u3K2Bo0vFg5NIOT6Fab63SKXgRuJpeyt3PooFDknb0y9dog5R9b1x0bs8DawhZB/OZCDMS6lbMaX95x5ZsOHW347DCK45JK27T8g6EMj2Ev7Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QMhEXesg; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QMhEXesg"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so65460935e9.1
        for <imx@lists.linux.dev>; Wed, 09 Sep 2026 01:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788941321; x=1789546121; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R2je63BbknUokaDi3WpiVqNteUMA8vRZHwmgqRUZSpI=;
        b=QMhEXesgUUrE3PI6nh1GryLLrRTNfPG8xI9O7Mb3cIdUb0c2pccBdesRXGTtdcAd/X
         tMUw6RJjLSjW28X0bLIR5K7NYo6Y3AnKyPwCmSWPkz9AwGtZorTElfLJ0XbnhbS57ozr
         nDtMjxtinRFH2cLUVf/vlfKOEyqYvv/nbONOKkqmJw7qO10EGTDtKpoFFva1piMrry+E
         yqIBvlKAZnuGdLL3xJx1u+POnmhJu3stXFhb1SzVMY4KzSGk+1877IKTkgqavmqaX4Lh
         Io2ICe9w1k/oWJjrgyuknLlZ/21qj2koQc+Kioo/cVaIqc9syMf7cS8BhEwEOw28okGJ
         Z3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788941321; x=1789546121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R2je63BbknUokaDi3WpiVqNteUMA8vRZHwmgqRUZSpI=;
        b=cKYRFdgtDzATw4fZjgynfPbf1Jcus3cZfi2rg4WKsq/yxsx7xQLMQV3YQhUVVnFSGP
         q4oxO9hxe89YFUi40Do//H34yc34HmP+4YUsXyv2AySp4JnoMvHp+gl0+xqJc3rGtGkI
         4dyGjVakk9S60sp7eeeV7wm5dKhbQRFwbVJC/Uqylq+oyoo+juuo9doJOYcs75/H5SE5
         ZHwDbtxXWOQdASjjUjMtacUSFtFD+eauqlZJq4D7uHRNv4AcSIXWoJa82ydGMVPYXvyf
         Hnq0Lb80TmIUmQibXZsWMsLvpcU3pRX1B7w0MZ+yBgbIVgwKbXOLIj7V5JpIx+hZKbmO
         Dcrw==
X-Forwarded-Encrypted: i=1; AKwUvByEui7E5H1zs/vM894XDo+LNH6u8HW9hiUpRmgxfyalrQuQO0x4rUoxqh7udK4xzUbIqmg=@lists.linux.dev
X-Gm-Message-State: AFuF++lCaGA6e3xEdIxYL6o+ERamOaeWk6qZhkb7YTc6BQtKBqaBVup6
	zoD6m7PPSBT675KH7SnWloCkhuY+HDy/mQ4RkmNof0cDZUQAMSaVPUDj
X-Gm-Gg: AYBFou0Gfzsg0I7yprzblC2cBnFPXu2Y8lEfE5K0dLsiJ9WS1BfGZdh+cSnDxStq5KX
	dx9dxCBXrRjb1rwTZzG7qAE/xRM18IAxeY7GpGJE2+EKpL9eYvuZq64nWRmoUX9aAyp4bCsczhS
	alL5ifu/ORIcd6ZAbMqWAy10WyTgBpeYjcTUXxcwUZ5OKY/pN0MWxjWsdnOGHWc70I1u5+FEch4
	QMwJAeGHbgqB+Ea4lUiewYhXeGEgxrW25/Og0/TtyJwhMTMuG/aP1X8g3xc/XrC4qANvVt4kHB+
	Reg1f7KEDZ+F9SRs/fAlvybp9aWVgGCf0VV3gCvOqB3bGsrlDDW3srlnhk88xjNQZtelSzpSur+
	IQZdEnRHpZunyfGprG4Hsc6Qp2Tc0z87ALisxNCAyx+5lPM72HG3vMwvvLUFqw+hPxONFVdvVtl
	2ql+cfany3k0heMjacX0NPhG4PuWm+QG+eV67pjxKVHW0vRXaK1S37w4ycIdHeDaKTyPbr/FGLp
	FXl
X-Received: by 2002:a05:600c:4684:b0:49c:fc6c:be14 with SMTP id 5b1f17b1804b1-49cfc6cc10bmr303543295e9.26.1788941320634;
        Wed, 09 Sep 2026 01:08:40 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm607453595e9.5.2026.09.09.01.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:08:40 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: haibo.chen@nxp.com
Cc: brgl@kernel.org,
	linusw@kernel.org,
	aisheng.dong@nxp.com,
	festevam@gmail.com,
	Frank.Li@nxp.com,
	ping.bai@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] gpio: mmio: track the direction of chips without direction registers
Date: Wed,  9 Sep 2026 10:08:39 +0200
Message-ID: <20260909080839.2297374-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909064415.pel5dilh7nrkxz6u@shlinux89>
References: <20260903075940.2089367-4-mehmet.fide@gmail.com> <20260909064415.pel5dilh7nrkxz6u@shlinux89>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

Hi Haibo,

On Wed, Sep 09, 2026 at 02:44:15PM +0800, Bough Chen wrote:
> dir_unreadable is now set from a second source (PINCTRL_BACKEND with no
> direction register, in addition to GPIO_GENERIC_UNREADABLE_REG_DIR);
> worth a line in the commit message.

Will do in v6, together with your Reviewed-by on 1/3 and 3/3. Thanks
for checking the i.MX7ULP/i.MX8ULP side as well.

Mehmet
