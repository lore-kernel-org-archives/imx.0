Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABFB3DA7CE
	for <imx@lists.linux.dev>; Wed, 25 Feb 2026 16:46:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772038002; cv=none; b=QZW68JI5enBfVkIxB1GX+KpnaC+WcWLhMBB3N4Zc/ssrjUlww+BTa6QgPI2PR/Bd8lDXbBEv966Peltkfw6ZdyX+8fD4ns8MEMqOGVGlQyqVjjDNvQe3oc9YMTNfQGS272zAjpEUtk/VtgfbD8q4VYE/TM1QbxSQe+dLTWqzltY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772038002; c=relaxed/simple;
	bh=M8/zoise0kqPkEtltRBb9dJx3yYarZ/7FX4RBH/H9lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F8gJZojcflbNMXRgmZqE5H9Zo6KYlgyQSK4/qe4OTwhN8bFA1A1i8lw4Af3Lg055Gzjk6Q3CvXKKFkqsJIbH5jLU3obtEXvkD1MMLzrnwWruXa14UUfiaZ08EVTA/AoOXde2nxKjbGJKI2t+X2L77tGKVQxDgIJ9qvE/i4tDJLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Sa38iQd+; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Sa38iQd+"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DE0854E41120;
	Wed, 25 Feb 2026 16:46:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CBDA5FDE6;
	Wed, 25 Feb 2026 16:46:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0122110369259;
	Wed, 25 Feb 2026 17:46:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772037997; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nnBjrX0bQL3U41NR9f2JQMbwQ/kpp6U5NlGNmgZ8yJA=;
	b=Sa38iQd+A9UKiqdZk/EdYjEH6IBO5bXLaf0J6duKpVyx8/5+NjLYE550rxS7kLJUpbpHY8
	eB50pkmmpah8JYJwqV/iT4h1cI3uiSibfVSTduskPOQhZAvMmoR2KDPs0mdDd2Yx9lPqd6
	gKZanXCP8ffkN80WWGgJ/0eLb71d7YuZJ+a35EW5WOLeAH0izuKn1tcU1wslNNoj/QFQJg
	q87D7w2MtOgobKscNEY2h2aTgMKt9zDGeccgmdZoolDrEXj0b+DcOplelDiZt1vaxkEe/m
	idP2ulswtNRCJrKEISKNX2X4RNejHlMMei41fYPIcO9LV9edq/8v5zzFmVkPMA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] ARM: dts: imx: clean up imx2* NAND CHECK_DTBS warnings
Date: Wed, 25 Feb 2026 17:46:25 +0100
Message-ID: <177203795880.1985489.4831780196878536315.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260213-imx25_nand_dtb_warnings-v2-0-f9d4b43bba24@nxp.com>
References: <20260213-imx25_nand_dtb_warnings-v2-0-f9d4b43bba24@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 13 Feb 2026 12:08:24 -0500, Frank Li wrote:
> The nand-controller schema enforces specific node naming. Adjust the
> existing DTs instead of modifying the YAML schema to match legacy layouts.
> 
> Update the DTs to follow the modern NAND controller layout, which has
> been used in the MTD subsystem for many years.
> 
> 
> [...]

Applied to nand/next, thanks!

[1/3] dt-bindings: mtd: mxc-nand: add i.MX25 and i.MX27 nand support
      commit: d86e70e9ca995942e848515b089e9be7430c862e

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl
