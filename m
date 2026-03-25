Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125803E1212
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 14:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448981; cv=none; b=pDrIoKB93YwO5cJQ/j4AQiDJG7B7PHrsAB5nitLT0K/oDBmtUtnpK4nLAHdnTzCGnS5OeDowEOOXPTpjqt0KrZVIdLVtoZKVxKNP+N6rT4V3p7vyUoSD152tVReU4BWovjzPl4YRC1TJ/NqTZcgODihgMRJT3/O+9lw5QzJQxs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448981; c=relaxed/simple;
	bh=QRNHI75je86qWmnoIxcJN/2gj4GFStsB4b6wlaojT84=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WlGjRahWvsqb/NfhvcxG20kR2MQE2+tulXSEv2JzKt8qnE1eE2DJcuAx7H+nODVIw3fiXVoGtg3SNZl43eWJ/shpiRq5imFX/nRQsExe2ogi8elJILdEruUWAKxgTOJJxVOg8fw6FjiOKeeSSofPgBcZCBniHtB2XWmSFk1DVw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O8rxUz9y; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O8rxUz9y"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 85B881A2FE7;
	Wed, 25 Mar 2026 14:29:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5974D601E2;
	Wed, 25 Mar 2026 14:29:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 97A3C10451A66;
	Wed, 25 Mar 2026 15:29:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774448977; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=RMKdRLPo5ZxYLv8j+Hc3AaldOSYVznoKCZwnCSBgffY=;
	b=O8rxUz9yHrILd9J72HXd3e+lz1mCEoFipYqmVDuoN2a/sdBJ7dGPkvZsGC55guTTFN4FDA
	QEFalJInpzSfswBj2waEDlURaIh6JExc9PzuXdYhJ9+FBmL38uGSHug2VP2bvHArPmRElB
	sFuLQr8pX/F3z8xAzReGtX4oC12Qa4ZXnOMU1ehKrN2sSjKdbcyv6xvGzmzuPtXWfkO1oD
	jr8kQqbNZFWPquKqGkDeIz7xOwdnlwOzC9rp8uBUCvmEioW5YiUeki+ZaUZ61vYOzOEjUl
	JQWhdvD956/sEgc66QHWyC4qzjo9oqp513XO/HCmwwg4vyoTyob+PjTIXxta1Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
In-Reply-To: <20260324221624.2424092-1-Frank.Li@nxp.com>
References: <20260324221624.2424092-1-Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mtd: refactor NAND bindings and
 add nand-controller-legacy.yaml
Message-Id: <177444897541.837464.3426048157066587709.b4-ty@bootlin.com>
Date: Wed, 25 Mar 2026 15:29:35 +0100
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

On Tue, 24 Mar 2026 18:16:18 -0400, Frank Li wrote:
> The modern NAND controller binding requires NAND chips to be described as
> child nodes of the controller, for example:
> 
>   nand-controller {
>           ...
>           nand@0 {
>                   /* raw NAND chip properties */
>           };
>   };
> 
> [...]

Applied to nand/next, thanks!

[1/3] dt-bindings: mtd: refactor NAND bindings and add nand-controller-legacy.yaml
      commit: 0ba8da2f318efc006ae5c080a4abfbabb5d110e2
[2/3] dt-bindings: mtd: gpmi-nand: ref to nand-controller-legacy.yaml
      commit: 17de8a68ac9807adf551f7d2d980e26d1196e41a
[3/3] dt-bindings: mtd: mxc-nand: add missing compatible string and ref to nand-controller-legacy.yaml
      commit: 3b2a422e23cf1998b85ccbcb90cabff01d17422c

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

