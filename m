Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7424A1946DF;
	Tue, 30 Dec 2025 13:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100037; cv=none; b=nFFoRdo4hjgPp3J8i7oaCa4l1Tma+AIcAGNePvGEpGnYzzv9oNRDlY0xHy1GGOrBSI9kw6cJGVsbhUL+CFBgxlFS3LGBFVpxPnc43ptGZt8HjKnMo7rHfynsswsVkOG0db6Kd7Ru7ExHjkusm2Ulo9EOjJNt33DkxhyNKBwSNdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100037; c=relaxed/simple;
	bh=PLCqksB3Cr/KKLSapdZxMx0M+d7N0LhJwagXWlsMxT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qETLRUm+Kd0UIC+zKzG3gFNYzemrJBaw5eIrIK/PTyZzFFZWuAFEx2Nkx1MajOKMcVa33OmcpuXM/mu0hSQWslaHeJR3pWrhFT5aAONQa579/Sv+txDUj9UtiUxeOiQ1qe9ODjFnCs9wi3tl4M1+a+8qsrJaXKKv2VFVPkG/UtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ABEAb+Od; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ABEAb+Od"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57D6C4CEFB;
	Tue, 30 Dec 2025 13:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767100036;
	bh=PLCqksB3Cr/KKLSapdZxMx0M+d7N0LhJwagXWlsMxT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ABEAb+OdfPXHA06ma9GXw9C7cH9A8WhWMfSRQ0Lw7HOq1U383L4434uwVE0SkIrHV
	 q+5CXGZdUUNwTpDAWuzHD7+VRwZF8GbGNOLF8r1EUojKY6IRmKN+NWg06uj00wDsvm
	 QFFCstEg/ad1iOG2mHdSBiJYOnJ32HCJHZ6Bvwkl39DnSynP6Ufgd6Gm62F0NwXFWo
	 KCSHTGwwcSlqNlPb6PpWHcgXauQeXC2xbmVgwbQAH6/F6CpbfdjAxkIL1Kbac7CAuW
	 RcZcnxUI7H2hrJfEQ4EoeD1JvORt7skiRCzuPSl3AMiXiO5tJr5ySZ2fqpQVQyPE+2
	 /zHf3tq6UCw4A==
Date: Tue, 30 Dec 2025 21:07:11 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: tqma8mpql-mba8mpxl: Configure multiple
 queues on eqos
Message-ID: <aVPOf2Ny7Zr0x0qa@dragon>
References: <20251222081812.1120998-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222081812.1120998-1-alexander.stein@ew.tq-group.com>

On Mon, Dec 22, 2025 at 09:18:08AM +0100, Alexander Stein wrote:
> The MBa8MPxL mainboard has an integrated PHY connected to the EQOS
> ethernet controller which can support up to five queues. Configure
> these queues in the same manor as done on the imx8mp-evk.
> Setting DMA to threas mode is necessary to prevent FIFO overflows, see
> commit 0bc3e333a0c82 ("arm64: dts: imx8mp-evk: configure multiple queues
> on eqos")
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Doesn't seem to apply to my branch.

Shawn
