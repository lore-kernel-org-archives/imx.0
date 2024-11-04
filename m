Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F194A08;
	Mon,  4 Nov 2024 16:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730737567; cv=none; b=N0SK7+HF5XVwT2da27cBOL1M6uvDVSXigtmTYs4CAHN1bBxos1TdPU2+QEnK5wQG7mUAppY+ysNW4VhGdbXGrukp7LKYW3x1jzFSEX0S51DsZCdmKaLv6NJFQL1amdizsmmeGEFvNKsc6Nov959QgOr6YvEZtdSmTCXx/8Cf9QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730737567; c=relaxed/simple;
	bh=f5iSCQILu6jeNnRD4Vf1L+vnN1Nn64JnpecDqJWxg3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cp4s7xAoS3fWU5iuyo8aaXdBwRpuZ1IDZguVk7pgj7kEHRYRZYZjrryC1VnzlNgA8AXKVWOhrnhhxQhV+D6ysXLxs2wIknwXCkEHMg/y+zwNLdO2TuOVgY6S0s4/8PwmBeUrjN/KdRvr2dEzFtYYnDl1VZhtVEtIKu0qVPyU3OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBttzQuh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBttzQuh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64791C4CECE;
	Mon,  4 Nov 2024 16:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730737566;
	bh=f5iSCQILu6jeNnRD4Vf1L+vnN1Nn64JnpecDqJWxg3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TBttzQuhAUy4ws+HjxZVRBoFj/eTKphy4uy3qkLJPMlcWv75k+hTnlm4XSApl81SU
	 5zVQgL/c5CkwgeBxkrG1N4SJ/DyP7UL/6PDLozAnh7/KGcKf2X/bFJMuAQ9myll1kn
	 ZkrJpPgJjzGXhtXWEM13vPQjC6zNrtYFbGnNwMpXial/J8QKW42HSjT42tWiF50UNO
	 uV5eBbBSWPfbPOIz763lRZLdGtXc5niJov4gyiwJEFBC74ftQ3RUwKyELoLYz+UWti
	 sxcDoNUGI3hK9+kEv1D7CxgM2Nw7j/3FoYi2muYs12nCaULWSp3ksUsM4HRcMldjLi
	 GhO9D9/39zeIw==
Date: Mon, 4 Nov 2024 10:26:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: firmware: imx95-scmi: Allow
 linux,code for protocol@81
Message-ID: <173073756401.397912.9689901882829044689.robh@kernel.org>
References: <20241104085622.177781-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104085622.177781-1-alexander.stein@ew.tq-group.com>


On Mon, 04 Nov 2024 09:56:21 +0100, Alexander Stein wrote:
> BBM protocol supports a single power button, supported by driver
> imx-sm-bbm-key.c. By default this is KEY_POWER, but can also be overwritten
> using linux,code. Add a reference to this schema and add linux,code as a
> supported property.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Changes in v2:
> * Added default value
> 
>  .../devicetree/bindings/firmware/nxp,imx95-scmi.yaml   | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

