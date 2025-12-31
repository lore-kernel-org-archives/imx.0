Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FFC1E9B37;
	Wed, 31 Dec 2025 02:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767147204; cv=none; b=jlaizaU8wB/Dvkb4GrWPk9DlaibRjubsDd8awXhgggC7xYd39/hYmDl4VzUkWyFNU3KHSKjARKoAYV8GtjQ0K5oLCBmU1beDdrIgB2hhuoqQ0rymzavKbEO2P3kFkjBm02pBbO7Necs4fkO2OKjh/CWd7C80sbvIdhf84JiEZx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767147204; c=relaxed/simple;
	bh=PCoedTJGv1Pig+WmC7clDH0HKtaOVbe/hHN1RGvcRTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EimZ58u0Sj5c/otjhuWqLvJyNSf2woXoqcm6acuwjAcnLqonReMwSGLMUseE++lVk7FKxEi1c54rZhW0cMvRwyRe10b4cEJAsuDLDDnnLehktJc8pTSBSB/p/K3sLpFXc7l1WpJZzULNNxachJF/EF8e8hV/dAnmKo8JjyDk/lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jzd9x2z7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jzd9x2z7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D097C116C6;
	Wed, 31 Dec 2025 02:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767147203;
	bh=PCoedTJGv1Pig+WmC7clDH0HKtaOVbe/hHN1RGvcRTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jzd9x2z76lUHE9i9/eoEcrwHT8qHqY3qSXA48kgRVpCeyo7CO+0S2ywMuWq/M2/1+
	 CwkXyDvT1a1J/siUxm6NupKhrp+tD9b6MxCjHu8299ifXVHi2+XZyTtNR4ktvRkqxk
	 W/J3ML4F9IpfFFSWAwu04gpCmVos3xCVcQuMsWebbysbGeYr7jWKxG3cF6I30pyNfh
	 6y3Z2HyvpqElq/7uYQfd+/oUeo5wI9SI/gSwYEaBcjZcgTeYBw8zaR7mcMgZhoVs72
	 l6TvWsh2dix9Jgij9XHwhv/PpHaicsLw8uT4A3+GB2H/ukfGgpKQwTe5Q6yZWaVW5g
	 igsA+lSp/amwg==
Date: Wed, 31 Dec 2025 10:13:17 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, max.oss.09@gmail.com
Subject: Re: [PATCH v1 0/3] arm64: dts: imx8x-colibri: add additional
 functionality
Message-ID: <aVSGvY0Zls3Fxr84@dragon>
References: <20251031125003.275033-1-max.oss.09@gmail.com>
 <aVOolTfi5s9jqG2v@livingston.pivistrello.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVOolTfi5s9jqG2v@livingston.pivistrello.it>

On Tue, Dec 30, 2025 at 11:25:25AM +0100, Francesco Dolcini wrote:
> Hello Shawn,
> 
> On Fri, Oct 31, 2025 at 01:49:40PM +0100, max.oss.09@gmail.com wrote:
> > Provide a pwm-backlight.
> > Provide the 32kHz Wi-Fi clock used during low-power operation.
> > Configure CMA from the device tree.
> 
> This series was not applied, any concern? Anything to change?

Sorry for missing it.  Applied, thanks!

Shawn
