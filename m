Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E78620F079;
	Mon, 29 Dec 2025 13:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767013595; cv=none; b=mpr43SXvoZY2lTixhawEQUasPBcrFWMi7c2GmA4W+JFniOVxgr4rkdsvPOskaOv6EWXzd/krCXIUKGOf0LlTloWAOe9xHnnccUC4EzLC7XgNsPQpQ+rRKfKRqXRLSez/Cb/KHLlf2liDFmt3eIwu4cMoFmRbra2vdI5unkLbd0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767013595; c=relaxed/simple;
	bh=jFjGONJihAmwyKW/OdcckuNuD2NA2N1p4mECotiyJ1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PtCXDh399PvnQxt8xqjVDLnLbx283HsBNdS09/HxHFBqyc2aN6mJEwt7AvqPLCEsd/Xlq2skhKoAc3vCZ3aU4EvIwQY8QnsiKpTxL6sFBrRk+m8D9ocL/r4ZG/wx1fU4MpBtRGwE3w3B19jG/1vXegPsPiW9DhBkzwvB5VWgPJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W02Q513y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W02Q513y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8DEC4CEF7;
	Mon, 29 Dec 2025 13:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767013595;
	bh=jFjGONJihAmwyKW/OdcckuNuD2NA2N1p4mECotiyJ1E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W02Q513yWJ4xTob9HVRF0Pq1oILBfNCX6ovkVjNReBP7ZYyglHoXoDUVrdUHBRCFa
	 XKpZBjMKD7zeRzFQDmCoRQTQ4J3DYW836MytLhZqIFgkXbR5NEKpMgnfLvRFYEccUZ
	 LM3ZHRrtG24hRvK0cETDY7+edd/0SyL70yAPOESwGe/35tq3h3nzI85DgxvVxT81EI
	 /TJFSJcWzUedMSe8WC/m9zjLDNbiyIK5shV4in7weh5bAudNqdSPkjZIiK/VCIzgz4
	 VyX791jSKwiR2JOvZ0q9mWqC+p+dDxp9eFuSr4AMbrxXiylOM1JzUJSZoCRtiogXGv
	 5RNAFZu4VswxQ==
Date: Mon, 29 Dec 2025 21:06:28 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, frank.li@nxp.com
Subject: Re: [PATCH v3] arm64: dts: imx943-evk: add flexcan support
Message-ID: <aVJ81FF64kmAgOOG@dragon>
References: <20251126-dts-v3-1-7545d957e795@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126-dts-v3-1-7545d957e795@nxp.com>

On Wed, Nov 26, 2025 at 04:06:44PM +0800, Haibo Chen wrote:
> Add flexcan2 and flexcan4, and related phys support.
> 
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Applied v3 instead, thanks!
