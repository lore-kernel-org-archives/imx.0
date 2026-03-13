Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86CC3E5560;
	Fri, 13 Mar 2026 23:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773444916; cv=none; b=pta73Pj1Dqzplx7yTpxf6+HdlRn0AmTs+kL9Pd1gV4sQjGVRKsCCfvkT0PEolBWDSpEDanegPdA2/mVfhaMTFYvwhgIkYAQt1lkHaSJ8yaxYes3O1v4xt+6IMJb/sP+w2vgm59twW3fpc9ClcOL034lz8G6WLbJGXBy1P+0yjL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773444916; c=relaxed/simple;
	bh=/hRUwsYm4PqkFEYuYuH/bF8g5FukaPINPr1mQ2EpLd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a9ZEeaOuwMKGNwMnfBBrFIVIqc6zxDbUfjkT/qb5btBZR6VM/3PGXrHhI/QWOeDYLEThMaTz7d9m9JDiVehCAxiyRUkwxpOJ0kANwSpSwTgsbWM1/01lyxwsDEcnhIWqIw93+Xnky8ciWpMAUS7G/yJ8MrZAzOJFPk+mTGvbemw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iiYuf8OC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iiYuf8OC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F0F5C19421;
	Fri, 13 Mar 2026 23:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773444916;
	bh=/hRUwsYm4PqkFEYuYuH/bF8g5FukaPINPr1mQ2EpLd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iiYuf8OCjy3FA5DJfnpKJKsFGOSW+MsCTynuS9J5P8aWOhuiAnfulwJDxF2CJl6sd
	 FyiSMXVt+QIqvYUkuYsVqG+aZ2Gt7mIRcfwuscTsJCQqwsUw5Gh57HpDNM/YWGEwlG
	 56iIAd1u2HzJrriILyCmMvc/ecr4pXr/EF/ZJcy/CJmHHbNdDU1EAWIDqWS17Fm+93
	 wqLRbGqdSHJPwI6kshTemjqyQIM+syq9nOBjpuLP3cv4yd88DvHdb6WntDeFE8zYLT
	 kJE3TYEiw949dA8DT8WEVH7T5OglaVXELfyhLGNgCTc44eyvbgNCtEzMZFo9G96NKb
	 Yo8o0MoaUXCag==
Date: Fri, 13 Mar 2026 18:35:15 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Dooley <conor+dt@kernel.org>, Han Xu <han.xu@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: mtd: gpmi-nand: ref to
 nand-controller-legacy.yaml
Message-ID: <177344491470.3643846.3861418038445425892.robh@kernel.org>
References: <20260309200351.1791162-1-Frank.Li@nxp.com>
 <20260309200351.1791162-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309200351.1791162-2-Frank.Li@nxp.com>


On Mon, 09 Mar 2026 16:03:43 -0400, Frank Li wrote:
> Ref to nand-controller-legacy.yaml instead nand-controller.yaml to allow
> legacy DT layout.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - none
> ---
>  Documentation/devicetree/bindings/mtd/gpmi-nand.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

