Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A331C69D
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 03:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755834085; cv=none; b=LmH0IywdGIAEj1qct2eAU/kAwTRaVElaUu0Fi94ylQfXNZ9FwKT9fZy8ekasipRgSfy3v/yCDxV7TMWYI+RoVdcgV0LDOhyzKxTLKcMe7HBEi32H8tvTkmSgRZFQULNLP5s7MlADHYoFsZtkZV+xHpwGqJA1NP4cf5sKi6un29c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755834085; c=relaxed/simple;
	bh=Q9UfM2/Z4W7gpExMeCt3SaoVnCq/lAFTCJplijh9VIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dL96bjmVNNVFIn+upOrYwi7jtPYfoXFZjdR41vMWM9UpJzsi8WsTty/AdChPUS2lTdfOhxoDlR7SoGUlSrAtQL2jIl8nIhWANNcddPRuFZdfzOMa6S4CtBV6EXvWulQ6rRlJW++7tlzxmWf6AEcmmernjbpFNmwtU8sxJTh4kLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=TwkOHTzk; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="TwkOHTzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=kmggs7RjLJziF9Jhj9Okr/khr5ZhLBgBneq+FasNT/Q=;
	b=TwkOHTzkXUOQm9WdVDvOaxVO7M7yC6n0AyT63IVL+3LYBbiLpmaZkzFTvW8tK8
	OQaNwmF+OQGCF/BRf7tJB3fUfNPRe/DujglbY044tEI3AxV1joBDdcSgimnqYVWQ
	Xoe0vVN/9lhYkTuqz0Zdffi/9izIV6Ekd75SyDIhNTmGQ=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCnrvbA5qdoifskAw--.6822S3;
	Fri, 22 Aug 2025 11:40:50 +0800 (CST)
Date: Fri, 22 Aug 2025 11:40:48 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Rob Herring <robh@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: add TQMLS1012AL
Message-ID: <aKfmwG55ajC5Q-AC@dragon>
References: <20250725062454.271191-1-alexander.stein@ew.tq-group.com>
 <20250725195628.GA1747130-robh@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725195628.GA1747130-robh@kernel.org>
X-CM-TRANSID:Ms8vCgCnrvbA5qdoifskAw--.6822S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUYJPEUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNQPtU2in5sMEsgAA3U

On Fri, Jul 25, 2025 at 02:56:28PM -0500, Rob Herring wrote:
> On Fri, Jul 25, 2025 at 08:24:50AM +0200, Alexander Stein wrote:
> > From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> > 
> 
> The subject could use a 'fsl: '.

Fixed it up, and applied both.

