Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1A1136990
	for <imx@lists.linux.dev>; Thu,  4 Apr 2024 17:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712253447; cv=none; b=WsByvAWnGc32nZNSEpd6k3xVUy+eTwB4HhAM8JuVtZaLV/wfaDa5YyBfUSWoTBUptr7n9KIChRSevTYeJFD3UvN0+zCIqPRa8GWn9QOA/v+ao8KQ5oLko506KpfyAb7lovsx0jOtdQOs+W51mFJ0UT7FeS3eoIdICyc61lNLiyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712253447; c=relaxed/simple;
	bh=YhU3sEXSw0D2kdXjvQ7QXDBcZkocQIOBobWOsVQFuAY=;
	h=From:Date:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qsux/G/UCZGBXkbYe2SeLjwegI7hULP0+nUspmP26sNU2q9vKIvR6cIqUfrU0IOVcCsoJ/jh94DDMKZNCdKTyDzJ5oXDLl/h0cHCB9+ENf3QEssjo/L1qja6Y4tHl8j/ME1pFBh4GdXK2lz7+F9sIp1jqsnSUIws8Kv90uT0yrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pj33W11Z; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pj33W11Z"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6ecbe6dc8c6so1130801b3a.1
        for <imx@lists.linux.dev>; Thu, 04 Apr 2024 10:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712253445; x=1712858245; darn=lists.linux.dev;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:date:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVHlK0SMG0qBoQQG+gZsRC+Q+8tU5y/gfXSNtSzLvIs=;
        b=Pj33W11ZsiNv5R7mON885Fi6gR0s7TPSkUJO7EFdX9f2XHG7YNtqiqb3B3IUxddEyU
         Cdq9X1q0+CBqUVILqWNv2yeIqMKgOijCejxXHGhz97AWzWod4lib81QVN6sjvySukU9b
         KYPLvAAumBzz+5hQzNhd0O4HOGa59V3QazUpdk4kzdO+PHr+tpTZKg93MDq9oNcNyvDZ
         4uVwuL+gdLi5TAEjyAtbORPMcYrCyODEH7h5YmFNBz/bjm9l2vRy9ObsjHT97I51+N/l
         QX0Ngd8RVOaHswUGNU3o2eiJV914ET7XUKswJpgNffvyXouV381K528YMKyoed+kF/uj
         7C/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712253445; x=1712858245;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVHlK0SMG0qBoQQG+gZsRC+Q+8tU5y/gfXSNtSzLvIs=;
        b=tHff+0ilejTBhQPwiGrfm5PXgkhGm47pgCPd1BKIFjWFv/xUgv9UK63P7R6ilDhc+T
         RuyeGR8k8i0DeEvhwPT09HTf2b9TYQ/JvKkd1pyGUysBNSS6KZGwwTB20gzNP8t5OVnJ
         hZ42NlqXYRSC+8qpDETY4KOUYRG1fNEczFcR47yvGnqnaHvofEP7LN1VTLp1xBJ1Snft
         8pOWl7xaezUNz2p9jp9Z3XTnhaPcymoUL7WLsUmefhp3LPG3DUlP09WVcJEY/PZMA1PY
         sC2aEykZWvZ0ydH5JEL3YH5HKPRB1JwxQ7hcQcED/i8zWh6kwNCCAD3v6g5ei4evqw8x
         TqRg==
X-Forwarded-Encrypted: i=1; AJvYcCWLoyQLwMx9JJATacNZdmGYD6T3kNjvsoGyq6XkIefDR9SmNautkpzqKP9PvUw8zPekQiCzgJs6Nv+Zr6s319WDittj
X-Gm-Message-State: AOJu0YxGf795QOO1sCaIqNxy8UXFDxDo5S30G6UMFZF6lgyASFRLL4/P
	fMGteo2G4c0S1P++TlL16V6/LiviUeMN3CwzobY8E/jaiqQr9koX
X-Google-Smtp-Source: AGHT+IFKDRLk2i3xeGnF/jxy9Jn4pmGaJmcF66H+hQFmmIl3WVwHo0yK60Pt5nXC11k3VcRteYTUoA==
X-Received: by 2002:a05:6a00:3d0e:b0:6ea:f026:4003 with SMTP id lo14-20020a056a003d0e00b006eaf0264003mr3811250pfb.3.1712253444957;
        Thu, 04 Apr 2024 10:57:24 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([201.82.41.210])
        by smtp.gmail.com with ESMTPSA id lb25-20020a056a004f1900b006ea918dab9csm14043537pfb.157.2024.04.04.10.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 10:57:24 -0700 (PDT)
From: "=?utf-8?Q?Jo=C3=A3o_Paulo_Silva_Gon=C3=A7alves?=" <jpaulo.silvagoncalves@gmail.com>
X-Google-Original-From: =?utf-8?Q?Jo=C3=A3o_Paulo_Silva_Gon=C3=A7alves?= <jpgoncalves@joaog-nb.corp.toradex.com>
Date: Thu, 4 Apr 2024 14:57:18 -0300
To: linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Joao Paulo S. Goncalves" <joao.goncalves@toradex.com>
Subject: iMX8MP Cortex-M7 Relation to Audio Power Domain
Message-ID: <20240404175718.pzcvffpef72dfuoe@joaog-nb.corp.toradex.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello all,

I was investigating why the kernel freezes on the iMX8MP when attempting to boot
the Cortex-M7 processor using the Linux remoteproc interface. However, with
v6.5, it started to work, and I was able to pinpoint to commit
b86c3afabb4f ('arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX') [1] through bisection.
The patch appeared unrelated to remoteproc, and after some time, I realized there
is a connection between the functioning of remoteproc and the audio power domain.
For instance, adding the audio power domain to the node in the device
tree (below) made it work. The same behavior occurs in the downstream kernel.
There is a workaround for the problem by setting clkim8mp.mcore_booted=1 in the 
kernel arguments, but this is not seen as a final solution (it seems to 
disable all clock gating).

imx8mp-cm7 {
	compatible = "fsl,imx8mp-cm7";
	clocks = <&clk IMX8MP_CLK_M7_CORE>;
	clock-names = "core", "audio";
	mbox-names = "tx", "rx", "rxdb";
	mboxes = <&mu 0 1
			&mu 1 1
			&mu 3 1>;
	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>, <&rsc_table>, <&m7_reserved>;
	rsc-da = <0x55000000>;
	syscon = <&src>;
	fsl,startup-delay-ms = <500>;
	power-domains = <&pgc_audio>;
};


Do any of you know anything about the relationship between the audio domain and
the Cortex-M7 on iMX8MP? The TRM is not very clear on this, and the only thing
I could find is that there are some mailboxes for Cortex-M7/Audio processor
communication managed by the audio power domain.

Thanks for the help!

[1] https://github.com/torvalds/linux/commit/b86c3afabb4f4ea146c206508527eb2a15485bcc


Regards,
João Paulo S. Goncalves
