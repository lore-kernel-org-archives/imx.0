Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227C73BBF0;
	Tue, 30 Dec 2025 13:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767100350; cv=none; b=eJlqGh4Vpput3yYjHbppWdxY3L76TF/h5vfbbeor+HckJ6WBcpbJWT0DjctXLcYWbLUUzaXD11S6GIrDljLtBrJX1oaHBL2yMgVZbgb3CT7sKZt5+YYZqQiizwX3xRHUN3uwWV4mnTL9rSk2sFar9t6tvaOEfElEgTzMEj+dZQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767100350; c=relaxed/simple;
	bh=R9HgzKj5DnzpWmoZYp/RfmX5CpfHXY11qVPk79TsB5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X7/AG927+f9GYVlzeW2WXdZKGezNTsrRF8ESYMflWptB6DkKH0m1hkl/T08xQi9fdGpGf7ZGTfAKIZGwBn7WR2WEU5zTHwwTTqmdFpedu/eBXW8+bqGIzcvvFGNqzNbzeH6MTNsJ6cLJGltC4pXKP+8vcrt4gAloHN6I+2Lq9W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nF7Qzn3c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nF7Qzn3c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0D45C4CEFB;
	Tue, 30 Dec 2025 13:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767100349;
	bh=R9HgzKj5DnzpWmoZYp/RfmX5CpfHXY11qVPk79TsB5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nF7Qzn3cth3kLyyzG2eMYUXQDEt0v3SlUgOrIohWf1o/Le99cybzvEEqIUninVPJb
	 iRLEi+rPjAFbXedGeRvcwJvBnjz5BX91Dp4qV5QKBFfbcMhXtSDPQqeUZDHcJzuZP7
	 16HmPYT/kPsPoy6gfv/UrWrg+UxX+JdTgMUWtVZ1gzf67gfghP0XygJEqJiusRSO4j
	 V9ZVgaDvzsUKCPbCiY2n/MrBq5w3+VvWx6PRyH6vJzK3EDIweXY1f9t2AIz+VevxbA
	 C/9j5s0i4oquZk9MxSDi/siR8DJYkLinhX6eOFQ4Syod2YW2tsYdPLp7CJOeNpLs4q
	 SNpPjp1spyxzw==
Date: Tue, 30 Dec 2025 21:12:23 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux@ew.tq-group.com
Subject: Re: [PATCH 1/3] arm64: dts: freescale: Use hyphen in node names
Message-ID: <aVPPtx-8Mg_lLLNE@dragon>
References: <20251223152624.155845-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223152624.155845-4-krzysztof.kozlowski@oss.qualcomm.com>

On Tue, Dec 23, 2025 at 04:26:25PM +0100, Krzysztof Kozlowski wrote:
> DTS coding style prefers hyphens instead of underscores in the node
> names.  Change should be safe, because node names are not considered an
> ABI.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied all, thanks!
