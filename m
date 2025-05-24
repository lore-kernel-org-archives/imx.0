Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0EA72600
	for <imx@lists.linux.dev>; Sat, 24 May 2025 20:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748119869; cv=none; b=P2swfp9eNHWZzvoAJjgS4ly97j4Is7LQ44HgFW5kNd7jba2bK78iYk51FgVSYsmb46SGEREEdo2O2d192+3yDFI57U0DPjNY2ngRIV+XTcY8EMolPnZ2RwBHiKH6JuszVVK6KFGkZFJO6scyux6OXxfwZ2LJGMR/hP5Rbqi+xUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748119869; c=relaxed/simple;
	bh=8e3qtdIEUU/UtHqgEFU0L/nDT5eQYIFkqlWHUgYAkSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUk4LoO0j3659tPLr1eSX/XiahK5IjFYSOAY6elR8pRJahTEvjxrn0HBCjm03y+k/rWa2AkVZKLxZvhsyJqlhcQ6qf8kgCCCiDSkS0subCOrJZL+3gSiKxxIP+th8s4ImBLC6NaUOQ1xmrrXESXcz9jKHUycSd1fniK+QEQgwf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eN2NJaAU; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eN2NJaAU"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C35D43A81;
	Sat, 24 May 2025 20:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748119864;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UUOyvQo9/EeP3DIU+h+yQywTeP4pomxjS3Y8EoD38FY=;
	b=eN2NJaAUm9dZUbijDMh09rQbJXrvEe02w9WScw7sU/2y6YgIdgDMWVkki0NAp6eklOoyWU
	EGgKUXso4XMJMaD+SwpePQ0ZHgF5lAilyY3MNxaRKME6Rk/0Vlr4bNrpCFVm7axKJmqgIa
	IuoZ4VFLrAlkKcVPCyEScwIKJZwygG82aEuYcOH8GtQ67qK6WBpNMRKRqAOEW+elJWR6+1
	87ooWs3iaNOn6G2U9EcBjUpQjEfQUymQwEyNX7U66OAmSvc+t4FjR50FpR4IpdiBSvM7IK
	AbeqwpBzXewLHSyn8hYcSFtkrjNc8JaOevkJgqTtfrI73zqMXBvsIW1y9Ge3YA==
Date: Sat, 24 May 2025 22:51:03 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: miquel.raynal@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	conor.culhane@silvaco.com, carlos.song@nxp.com
Cc: linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH V4 0/3] support different number of clocks for
 svc i3c controller
Message-ID: <174811981012.1255947.3023044294163637573.b4-ty@bootlin.com>
References: <20250427083230.3325700-1-carlos.song@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250427083230.3325700-1-carlos.song@nxp.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdduvdejtdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvugemieefjedtmeejkegvtdemtgdtvgekmedvkedtieemkegrtgeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduiedprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtoheprhhosghhs
 ehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
X-GND-Sasl: alexandre.belloni@bootlin.com

On Sun, 27 Apr 2025 16:32:27 +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> I.MX94 and I.MX95 I3C only need two clocks and legacy I3C needs three
> clocks. So add restrictions for clock and clock-names properties for
> different Socs. In driver, use the clk_bulk API to handle clocks to
> support different numbers of clocks more easily. Make the code cleaner
> and more flexible.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: i3c: silvaco,i3c-master: add i.MX94 and i.MX95 I3C
      https://git.kernel.org/abelloni/c/489c773a68de
[2/3] i3c: master: svc: switch to bulk clk API for flexible clock support
      https://git.kernel.org/abelloni/c/cd1a6a0c69e7

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
