Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F882E6CD8;
	Tue, 30 Dec 2025 08:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767083996; cv=none; b=a0RnuWhV1Igvz+FoTXkcdqxJPbvWD6XwFIRb8KaacGl2E9jew5oMbovXD3ZsNnJQ2/XZUaPkVxV0XMrc6NEP4PwOoK/1V6GTa6m5C53wC6WvvzRrMFfJv2EviAU9402j/nDLUhTxLGGw282Y2IKmH2qxERjyBelW1AEJoV44ggo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767083996; c=relaxed/simple;
	bh=2dOZFcmc9Z4oX5yQZR4ajWRkx1TMtyp5DJ+PG+B2X8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B13TPi+nU/0J9ul36ipF6JPqBW9OcDzxPk1pJbmarqbdWlNChoVK2/gC1RmdKYcq9KQIjU0Kgi2Vdhvr+k1UtT9q2GqMmq1598bWIGTIJ7BB7RF1ImZYH4TwaPwuvbd6vbTGroHLtzsB574Gig15Vu7K29kc59MGBknclPGja/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDzlMKVR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDzlMKVR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E715BC4CEFB;
	Tue, 30 Dec 2025 08:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767083995;
	bh=2dOZFcmc9Z4oX5yQZR4ajWRkx1TMtyp5DJ+PG+B2X8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iDzlMKVRlXkF9UpB7FmM4wO/dZCAafrnPmq/jf0ng4UOm0tsxMMkJvaZeeYg/iwQL
	 7uVKA1gZR8xEyh7THb/tSp52TcZ6D5yw12zC88zThjxn4YQJHLyzfbREhIfI3UkTyX
	 wdJPr9xpwD5O8SX1AoGXKgUJX+qzbEgMdGT2tnVP2oQ9dc/C7R92JZkKeMlEXCG7hF
	 iGp08Te2GXnEkHjqtz/QKAFDw6nTVOlNrZcvw8vBRSG0+LsJKOjhHp2qYd5Mjpa/HW
	 OuiZqvlwq2tB7bh7HFPCionKnCkrI8dZbDU2f5HoPLhXrP9gbfwtpF9R9EPzhsceh5
	 MzRdwSNPn51Hg==
Date: Tue, 30 Dec 2025 16:39:43 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Fabian Pflug <f.pflug@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Haidong Zheng <haidong.zheng@nxp.com>,
	Danwei Luo <danwei.luo@nxp.com>, Lei Xu <lei.xu@nxp.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v4 0/2] Add devicetree for NXP i.MX93 FRDM board
Message-ID: <aVOPz3LOrLHqOM-w@dragon>
References: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>

On Thu, Dec 18, 2025 at 12:39:20PM +0100, Fabian Pflug wrote:
> Fabian Pflug (2):
>       dt-bindings: arm: fsl: add i.MX93 11x11 FRDM board
>       arm64: dts: freescale: add support for NXP i.MX93 FRDM

Applied both, thanks!
