Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37892288B1;
	Mon, 29 Dec 2025 08:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766995836; cv=none; b=EH1yNmX31VhMGn+U+GPY+oaeGkTF7ylAawBbTyFPKdHD5Bu2zH771qNAIsEgC2zFkcBoB4vcYuPYihaosE03yQo+v4V+rinwXs7Xob7O+DFrSMerTq/a/HGbvA3UgTE2V+1I0kIgVjpAjNy7pLR1gpFTlJRYboZ84hY+nDbTsGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766995836; c=relaxed/simple;
	bh=JOVBKdncGtJtP31diX3aS+NXDdXFROexEapDwpZmu4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9uyvFEp/H1dmKgBt0wYYpv1wUkfAd74035n2/36pr/JX0tOiPD5oSOtVfhI04MbI1CCbjY5u8HckTiwdAjklEEObG/01N7ckApFvWjKaYvXBRwvIXuuV4nDHNFVn53keNrwpUojDVeaQfJw+b83aEdKtZa+nPvEqm9mzMJnONE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBatk/Ia; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBatk/Ia"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7A1C4CEF7;
	Mon, 29 Dec 2025 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766995835;
	bh=JOVBKdncGtJtP31diX3aS+NXDdXFROexEapDwpZmu4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KBatk/IaPnAv4G2MWEho8CuYY9/Tu/UGckh78JyFHTcdbnDPeSlwwexP+rTcAwZLZ
	 MspxoNmhNC/onAo7Klc0rd85gYkMydGue3elVp06ymrDePZgHnHs1hyp7iOzWEfLpM
	 f8GAR4DepR9yehzw2wi4kTD8XM6U21NNxb1JEKwGNyTalh9QtRjq4LRKyRL4VvRry/
	 VJGeGJTGCyne13H2WCwJZGtpcRlmwt7RvUXaW0Ct+m9QcwREqKFkc+wvYFsZmL1r3K
	 b6hFFvDjpMt/ntVM5ldopNaHnurvAuyHdDaZ5l9ieXKIO82ue6rF+rHAmN9Hyt5a5R
	 qPZMjweAxy9Vg==
Date: Mon, 29 Dec 2025 16:10:29 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Schiffer <matthias.schiffer@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com, Frank Li <Frank.Li@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: fsl: add TQ-Systems boards
 MBLS1028A and MBLS1028A-IND
Message-ID: <aVI3dRAEh77-PVND@dragon>
References: <20251117130916.803047-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117130916.803047-1-alexander.stein@ew.tq-group.com>

On Mon, Nov 17, 2025 at 02:09:12PM +0100, Alexander Stein wrote:
> From: Matthias Schiffer <matthias.schiffer@tq-group.com>
> 
> Add two mainboards for the TQ-Systems TQMLS1028A SoM, based on the NXP
> Layerscape LS1028A.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@tq-group.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Applied both, thanks!
