Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34E9288520;
	Mon, 29 Dec 2025 12:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767010720; cv=none; b=mK9c2dbLgGzW6MYehsqKT5AiiC5YT8DCq/SzDts+SfEBAYZgdM9flvbMazh5hulL1xpm8yQJwihNi+uvKT1Od09gWqcbEQp01CvzseezUhnqpvVZyTPlEQKX04M2J+QWTHGUntvxv0Lq2gkyJSq3mAHPrcseT5hqx06xoI8/TTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767010720; c=relaxed/simple;
	bh=ueoVSPNquBLMs0IZHz5jDUIbmWSHbnPAzQ+YsxDPZPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g8Uueel7dr8vle81EKDDxSfz5voCdUryDWkNSqxu+STSWU9uaOywKhkaIdxlRJkDPlhIe0UOhNqIP2TQbFAStSC6z/BBYKVHu9vkcRxp4J04s3XwhuEnUqnlad4Ihvknu9gUP3YVVHcnAopxt2ZlcvudXOD4chKA3rdTmQ/rME0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQwECaom; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQwECaom"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D621C4CEF7;
	Mon, 29 Dec 2025 12:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767010720;
	bh=ueoVSPNquBLMs0IZHz5jDUIbmWSHbnPAzQ+YsxDPZPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OQwECaomc48RpCqWU9YQLRZNTXhZKcNHZEFeKlJ7z7X65t5ql8JjVc1ZklSUIaeUW
	 bJfeZbYvpIhxXQq2PGv1wJ2zcrWs7V1GoO43KLZpGuYId/CO2ZN+VCtweFauvaOXho
	 JKW7K9fQ3xSapIKC0wpP+TRav4+Kp+ik6WSMp04jSFY0V1YtxPvi2Lp2anrFCRoxyc
	 fs/nZJ2X7KxcDdgLMjuoTUHgRUFGIJiIOBmYEp7QMaSWxDb2Kd05hAfXjvcMPnzoGK
	 z3dJunan7VxXBJkt6BPAulB1y6SGnnmaSir4f55YbBCa+BpRb3B2sOD3InIe7YlI52
	 O/HNXl74VrgwQ==
Date: Mon, 29 Dec 2025 20:18:33 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, frank.li@nxp.com
Subject: Re: [PATCH v2] arm64: dts: imx943-evk: add flexcan support
Message-ID: <aVJxmWaSgG1-dEdo@dragon>
References: <20251119-dts-v2-1-e8f8d91280dd@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119-dts-v2-1-e8f8d91280dd@nxp.com>

On Wed, Nov 19, 2025 at 11:34:18AM +0800, Haibo Chen wrote:
> Add flexcan2 and flexcan4, and related phys support.
> 
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Applied, thanks!
