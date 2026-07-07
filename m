Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD083CF1FF;
	Tue,  7 Jul 2026 06:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407228; cv=none; b=RN92fNXFqBy7+f2r3m1eWFb24gsoh2u7BtbkE31I4py6WDG0BH1JFKsKAlboOLWwa+Mxr7u6Ahmt5lSLfhTXrg2j9lXrLfqSWN84wjoD2mlNw+PBmSNg8eC2vlki97z5r+GkdVc6W9772RVAX3GfNeu8WzbqTFe0dQt2GuLCslU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407228; c=relaxed/simple;
	bh=l/gi+BZo6ThnO/G247ifExseAfWUqdKg/mGRm1zQ3DE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4rt2394OIToeIhP39U5M58vSqJ9balPKNM8CWXpqNx0h7yXajZoTMeu3U0MDKUJa43LNNqVSPZ6J/WagFRsDitYm208MZuHNDWYNC2++M8wmVC7ZxoY18S2bF7KzGOwxsgwxywvezrhcRyppURfdK3xrc5BIkEkGh9Xej3dyqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BQuv3+yn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BQuv3+yn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7EE1F00A3A;
	Tue,  7 Jul 2026 06:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783407223;
	bh=v0mT1gYQutRbQjr/KeeBWDlUXYQvp5XqEtNxRNxpekI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BQuv3+yny3139qCwzgvCBjU5d1NWhDE3G7OLGFL+dceVhuD4j0RX3oThwQzUmNd21
	 BUZdb8187uOzXqJh/MKgrOw/HfY/SmbI6oVh8B2yoMEG8pxaq+eb21DK9MFA/w68iC
	 pmHLPDjtdIQAO67bYZ30nOkdZt+krW5PL2QIp4ziv7+NXZLfo9+sr2K48xTjNuRqcr
	 pHuVM4XXOT82oBNvv9JVJzCGuLc9FzNTlBZXfPcHvQ337qsBD/yZ8EKhBzQwcG+2db
	 Slbj3McbZtH9BbtVeVX5bV7yUShEoTLtTowJKVe2bxHflL0FtIuxgdSGISMeedkirj
	 6HjsLM3s6ATNw==
Date: Tue, 7 Jul 2026 08:53:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v3 1/1] dt-bindings: mfd: st,stmpe: fix typo st,stmpe601
 (should be st,stmpe610)
Message-ID: <20260707-little-organic-horse-a0be9c@quoll>
References: <20260706192932.1573584-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260706192932.1573584-1-Frank.Li@oss.nxp.com>

On Mon, Jul 06, 2026 at 03:29:32PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> The compatible string "st,stmpe601" is a typo and does not correspond to
> any existing STMPE device in either the driver or DTS files. The correct
> compatible string is "st,stmpe610".
> 
> Fix the typo to ensure proper schema matching and eliminate the
> following CHECK_DTBS warning:
>   imx53-m53evk.dtb: /soc/bus@60000000/i2c@63fc4000/touchscreen@41: failed to match any schema with compatible: ['st,stmpe610']
> 
> Fixes: e10038ce1ba9 ("dt-bindings: mfd: Convert STMPE to YAML schema")
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

