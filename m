Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A443DC4A1
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 15:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773243406; cv=none; b=D9fSuoWdiCtGEqrVXCJ4gYFTCkvsPkX7jGFHmkSvQcqETYBdJ8GDaiNi1/0bMQW3xt7bvpFltarREe8aP6MukeU8/Qvw9hpJyFtC9RmCPqrL0aMVjtCCKVGduG11eqZf9lxAhuI6jS3xQxEU/iklnJUe/L5aZAjqEIrHAysFZbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773243406; c=relaxed/simple;
	bh=R1do2VJkIK00uFSGkod9FOr+dT90KAyycBGwmrPCp2M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=HB1YRq55rheEpb4u7491TG90Gmfz09CSEQwJFzQX+pk6xooIt0cyK/SQ6Za49MxyC7yaD/iAv3OkH4ABvl5zmDM5ArMrhayeB6PRvFD2kHjZLEZ5eNkJTGXH5dfPIi3z/wAEOev9liVSAhs8wU0hmMdu98KQTiKmlWvUPIAoYRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hTMYs8gb; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hTMYs8gb"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8AC921A2D72;
	Wed, 11 Mar 2026 15:36:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5D02060004;
	Wed, 11 Mar 2026 15:36:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3133C10369D16;
	Wed, 11 Mar 2026 16:36:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773243402; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ApzOhorybY3ljiB6CsXLMn4hxGlYu1mNujmVp2N2niQ=;
	b=hTMYs8gbtABgvr7pKPME09y7bDNuLcSMYon9S+fqwHgyT7pTRCzRe2Q5cx3h3jzPvyu78u
	CSXEv3072sVe8fghTqCD5i2AJ6Uo13xuqGXxB1h9404kbtC5/WjpKKY4SAW5vc3ir3h2Hz
	atAnyUR184z2lFRX0XgRoazDzSQtq21N5t85HfAm8BzVR9whLUNsf1j9AkhRW5J9/GAOC6
	XcnI6kSvTQ2+lEqNEw1l4QVKVO0AZHh7cm2EEcwDaEEz13uEDEdsxsQhiWtxgFOj2O6436
	/eIU1dFSyUYSc1CarzwNgnO5QbVNS/qksn6jY0M27XejcC+rfzKvwrRIGuhFKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Han Xu <han.xu@nxp.com>, Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Max Krummenacher <max.oss.09@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
In-Reply-To: <20260310-gpmi_nand-v1-0-6a665151aa75@nxp.com>
References: <20260310-gpmi_nand-v1-0-6a665151aa75@nxp.com>
Subject: Re: [PATCH 0/3] mtd: rawnand: mxc: set raw chip's to child nand@0
Message-Id: <177324339988.696314.2482763998911227271.b4-ty@bootlin.com>
Date: Wed, 11 Mar 2026 16:36:39 +0100
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

On Tue, 10 Mar 2026 15:07:36 -0400, Frank Li wrote:
> The nand-controller.yaml binding requires a child node (e.g. nand@0) under
> the NAND controller. However, the driver currently assigns the controller's
> of_node directly to the NAND chip.
> 
> Search for the first child node with the "nand" prefix and assign it to
> chip->of_node. This filters out properties such as "partition" that may be
> placed under the controller node in some older DTS files.
> 
> [...]

Applied to nand/next, thanks!

[1/3] mtd: rawnand: gpmi: set chip->of_node to nand@0 child node if present
      commit: 3a6e21ea57c8118d3095f073aeaf9362dc2c3865
[2/3] mtd: rawnand: mxc: set chip->of_node to nand@0 child node if present
      commit: f7bd1948a5461df9e1027d5bd9a511e754146689
[3/3] mtd: rawnand: ifc: set chip->of_node to nand@0 child node if present
      commit: ee78d466db8a001d137d6f9c97010b343aee456b

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

