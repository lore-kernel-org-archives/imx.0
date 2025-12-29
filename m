Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8001DE2BF;
	Mon, 29 Dec 2025 13:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767014238; cv=none; b=GwJexc/ZWzURJsWOA0KCoyjarhgeNhYHGVQ5LXC68ey9Ps0TQeFNexU4Md+vvQXQl2NjBHDGtUB1+nRUfw+GeayYR5F/6ztkrHNfKCdPaD1JSkvKOk/qwhM2eddo7fLlM2rmTV8RRdgEt7Tog+AQGivaURiZLHOZeCkSpL8KG/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767014238; c=relaxed/simple;
	bh=ELRz3r/efm8jRls4UubxaTuJStZEM4hUic0vnRP2SLY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lequ/VjHAPC7BP7/rGgZe05SWO0C38cEE6ghFr9d2Lni7vmMwj7m6ig4m8L3de+1Ul1JegOkzUDtvIl8hu+86fznUGQESnHeSdTQTCFhw330KrWREWOjZhIeTiYwlXkBtpm0b7M2Z4tEpveerKNdKgL8Mct9mf95iBEmGFKX9jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZfLe10d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZfLe10d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA20EC116C6;
	Mon, 29 Dec 2025 13:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767014238;
	bh=ELRz3r/efm8jRls4UubxaTuJStZEM4hUic0vnRP2SLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aZfLe10dtjE3bAL+5UFV9QIdAPFxEPYcWsKPiZiosAHV3sV5LKnGv48DfZjpV3bmu
	 McBYdrnLGKBqqm9YtP496f/S7/BHFBjv+Z4wDFi6QL3Fwi2uJikV5/u/+rYnF98b3R
	 Ounvrvvu4fohz2IgQFm67nS5HVDRt2V83eMVDioAeOxiMc3YftkWH5mpHyUh9/f6I0
	 7PpVO/OubR+5ZBPsBdEH86XhcHbz4XdlIvw0R9AZwfmGE+s6jO775EwOFjM33s1IAz
	 yH6DSi+2qVjwxjMcMFqy7uUJVJwrKMkKmGyu1ZIrkNYiClYMsD+nGIOSFteCefIeuA
	 Z23fnNMiVumrg==
Date: Mon, 29 Dec 2025 21:17:13 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: imx93-14x14-evk: Add bt-sco and audio
 XCVR sound cards
Message-ID: <aVJ_WYf23l93i65y@dragon>
References: <20251201065844.3823323-1-chancel.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201065844.3823323-1-chancel.liu@nxp.com>

On Mon, Dec 01, 2025 at 03:58:42PM +0900, Chancel Liu wrote:
> Add bt-sco and audio XCVR sound cards
> 
> Chancel Liu (2):
>   arm64: dts: imx93-14x14-evk: Add bt-sco sound card support
>   arm64: dts: imx93-14x14-evk: Add audio XCVR sound card

Applied both, thanks!
