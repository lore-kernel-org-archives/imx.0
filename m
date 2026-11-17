Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925409;
	b=skRARaLjORYUMMNCTWdflXhgXGdRFaiEdqGjFx+gDkwB7ORkBbRZpl0Un7L9mnP3NBY8
	 LlO9avt4Y5IGYXCqCyDVhKz6FC6pwdNDMlWiPaChyYndBLoSN37hF1B4fU9a66lHKX1UC
	 ELZUsl1El9GIykk3zqE4DqNmQ674vV0Er5JGT/xxWRN2IHGobgtj+ahWqSyp5LzuhJ0X6
	 d/mGv8ehDrHUyYJZqDBMa44zSz1Uf/O7M1McMjJq+rS3JoE8NN3zBa69zL05B50p1dNI5
	 vf3OitJVaXgAGldY/TfU09glmr0XJbUWSdTTe4UFeNesYaUowcMm2w6QBU3+HyDaK3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925409;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=XtFQDcwceQa3Sr+OhE1k+wWRHerfk4qk4lkJyg2kfJo=;
	b=k7ilyT6eqnbI/iJkTLOYNah6EoIOj3pJJWp0JJDBaoP7Z81s06y4lnQMXtyQ2LvorBwM
	 ZzPwO58R/G99BpKA2nSvrbiu/4ulmYxozLovbHZ2lmeijsb6iwenIIfKkJkeYs19zrR51
	 InRa3YGJfjIfQkwc5VpdBoXP2zoPAYbExKA4NJBxU1WXxEdHmPkTxWpJ61VBuDUF+5M0o
	 2IYPy7sz770b85L2Swo50wspMq/cCOfYkPzUWjWnt4HMaVtjhFLFer4a6pq7VOPeKbkJ2
	 xoyWA7DAxXXYGIp55xq1NlGkqASav9aatgbh+L5SkhMFGFJJb3hs68Z32X0CZdOl8qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1q1S9Pd7;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969A460A3803
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 14:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 969A460A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1q1S9Pd7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3E62A4E4157D;
	Tue, 17 Nov 2026 14:23:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 120E55FD6A;
	Tue, 17 Nov 2026 14:23:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B0D011BC0039;
	Tue, 17 Nov 2026 15:23:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794925405; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XtFQDcwceQa3Sr+OhE1k+wWRHerfk4qk4lkJyg2kfJo=;
	b=1q1S9Pd77qyl4ks/rAZs4tWBzzKJxwbhs+GjdlKzNE8v8VfwmKF1gAM4tm+wT0HKqXcAI8
	V85azkHVlxyod7PF09JjNMsoOJcva5H4RmM0O9j269IgEIWVqqsjN9q2t52UD2l+Pt+Rba
	fGgerv2m2bVMgqfC3zwj7QEe38Clb9aL0GNUHpXkOwI/CzSrkE28jExKHZM51eC/e9M3I5
	XVTsoW4/jxNOIsB0teTHQ++StlGA6+fp+3tSLe+8N9qIiCkIiblYqh6LUj/14ctV8D/8lZ
	olnCiWeeX8ixtcvqSdcQJW7OSR/fmDNkexg9nNNHhdgJGQMCsn2h7SfendL1Aw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Frank Li <Frank.Li@nxp.com>, 
 Alok Tiwari <alok.a.tiwari@oracle.com>, Runyu Xiao <runyu.xiao@seu.edu.cn>, 
 Chen Ni <nichen@iscas.ac.cn>, Kees Cook <kees+treewide@kernel.org>, 
 Hemanth Selam <hemanth.selam@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev
In-Reply-To: <20261111202502.3860647-1-Frank.Li@oss.nxp.com>
References: <20261111202502.3860647-1-Frank.Li@oss.nxp.com>
Subject: Re: [PATCH 1/1] mtd: nand: raw: use dmaengine accessor API
 functions
Message-Id: <179492540302.2259780.2818998667835752553.b4-ty@bootlin.com>
Date: Tue, 17 Nov 2026 15:23:23 +0100
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 11 Nov 2026 15:24:45 -0500, Frank.Li@oss.nxp.com wrote:
> Use dmaengine_get_dma_device() instead of directly accessing chan->device
> and use dmaengine_prep_dma_memcpy() instead of calling the function pointer
> directly. This follows the dmaengine API convention of using accessor
> helpers to decouple drivers from internal dmaengine structures.
> 
> Affects cadence-nand-controller and fsmc_nand drivers.
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: nand: raw: use dmaengine accessor API functions
      (no commit info)

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

