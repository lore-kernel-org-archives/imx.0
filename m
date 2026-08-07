Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02C238C42A
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 14:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786111229; cv=none; b=qpFHXXsWZWujVJWPNffkjnMHVnUp1A+TMy6Y8xK1wXpTkfoRQIJ71MG+scHiR40Fc9G9nXZVaUpZwL2wCNuNAKWqStAC2ehr24koa2MG1CVG5IijbrKRYRdukB2B4TKEu9cHinWMB5PLvf+5STp7DVzj1onVVvuMVHtF460Erls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786111229; c=relaxed/simple;
	bh=zHfzoMwzv1IhD/7riaOmbKN3+iUUAtDc6/paSJ+0m/I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EW+gpXFf0IlobpkyOnapFDkdg70VqoPNZStopA9ws3143WK/S4Dhv3bbjO2qoKqsUuPA5nzuSAoMaJdO4f1NF+huIRPyMl3ZhWtBorYzbsfR8m/F8y12MswWNEoRdcPCozN4r+mWTS3azH36sNH5+Rm9SUPVhysogNYOBxahWtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=TRddY+V6; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="TRddY+V6"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 374354E4113B;
	Fri,  7 Aug 2026 14:00:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 042F9603F0;
	Fri,  7 Aug 2026 14:00:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 066AC11C37961;
	Fri,  7 Aug 2026 16:00:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786111217; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6lV9/IV3vY0Q3vFQimwyVCaCzcjeyGIXdqkHQptqsAs=;
	b=TRddY+V6wgS4KZ8eRTVUQ3rg3Yup5zn5SyOY4mWBBzyOYE9Kzg03eNPrVbtCS2haZlRXyj
	roZlAZ5KU7BvY9HZsAqHhDYibllRcCZJB7RMtfki3sM/eLEnowA3F1ATEqSgFpbfMBj2w5
	p31u20hL+4Zy4qzcKScrC0Gxdf1X1YV7qzwxHYDdiuV5PLTU6S+vnwqdcfQqNSqU8kJqNy
	80Ifofrf55FX1yF2iFd9f/WocxuXRRupwLupjoVMOFAoYNggs0DtKrWfGDlWj+rHu0DrMa
	jmOZM3utZFqEPnYxXVBT0hnWOgw6pAJ87c01ZFjAWq1T7pVBr7wml88sZlK+7w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, han.xu@oss.nxp.com
Cc: imx@lists.linux.dev, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Han Xu <han.xu@nxp.com>
In-Reply-To: <20260729-nand_debugfs-v2-1-2631e92adcb2@nxp.com>
References: <20260729-nand_debugfs-v2-1-2631e92adcb2@nxp.com>
Subject: Re: [PATCH v2] mtd: rawnand: gpmi: add debugfs entry for BCH
 geometry
Message-Id: <178611121596.758547.3889962762044128142.b4-ty@bootlin.com>
Date: Fri, 07 Aug 2026 16:00:15 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 29 Jul 2026 14:22:20 -0500, han.xu@oss.nxp.com wrote:
> Export the BCH geometry parameters via debugfs to aid debugging and
> provide the necessary information for legacy kobs-ng tool. The debugfs
> directory "gpmi-nand" is created under the root debugfs tree, exposing:
> 
> bch_geometry  - blob containing the struct bch_geometry fields
> raw_mode      - flag indicating raw mode status
> 
> [...]

Applied to nand/next, thanks!

[1/1] mtd: rawnand: gpmi: add debugfs entry for BCH geometry
      commit: 113f62225e98febabba0fee00afd29d4eaf65abb

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

