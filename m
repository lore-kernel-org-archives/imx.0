Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8452BE03B;
	Tue, 30 Jun 2026 07:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782803826; cv=none; b=cFlLQL7RirtY35N0mJzHbEpyik6BcaeIDDNCtO3DlHBSZN+s46Ek2H9+3eCIyqqvqp1f/CPxB923TVEKi26yVGfAX4PBxuHuaNrnIH+BrpqyOOmLzSQuavXI1ytAi+nQFFUCLZ2tGsV+lKVFdQO2Q8fh3F+QK1gQuGvfAlVorI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782803826; c=relaxed/simple;
	bh=CnOxLrvS6VwbsrpoGfJ+JIBXBBEmKLj/aQm51FG6PwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fyd7T1DCuw2DhslMkBpowy7/KVlrR48TvSylvsFbk4vb4pBm0xBxM7vSesRZNSF7oWziyh3tx6XpMDvnilygBWIKGSpgbzvEzW6vVjF3f8pYPbrh4o8NidwR7+HDLlyMe4B2UwCJyTVJk+YsNChLqc1BhvU91Z19fZXcPSbx4lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N50/KIrd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N50/KIrd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EE281F000E9;
	Tue, 30 Jun 2026 07:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782803825;
	bh=iCdrMUvSSw/mZ+gIsbwP1bklG4AtyFzFYJZ+5GttJBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N50/KIrdFzKgp/X3seWtKpS9i2aaZ8WpCHLUb9N10JCELAE8iJTzJDh0g2klfL+5+
	 DfaazjdfOO1T+tlX3zQqFxda68kKphzwXB0bCa3mG0MX2BaL/a41LncCZvtiVlgafp
	 SBDzGGmiOxpc+rdEunnKN8lR766aGaHGNK0tKWL+kSJl8rPqz0kx7Sh+HUF8HfEjEB
	 eAqthZ+tGwhggZItNXLA/9AnIPPk8/Ec+AleCrhMjypM1tpL5y0sP+l4CFnCqdw00f
	 sZf3bA/yFK1nnZlQ0quwAWCbMzrWUBUx7kQGlrH5v0nhkul0SkNRU5e5bSApt3rlOr
	 8lOeSyIYQqXYw==
Date: Tue, 30 Jun 2026 09:17:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Linus Walleij <linusw@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev, 
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: mfd: st,stmpe: fix typo st,stmpe601
 (should be st,stmpe610)
Message-ID: <20260630-energetic-spiffy-cobra-5b9b9c@quoll>
References: <20260629223735.2559722-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260629223735.2559722-1-Frank.Li@oss.nxp.com>

On Mon, Jun 29, 2026 at 06:37:34PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> The compatible string "st,stmpe601" is a typo and does not correspond to
> any existing STMPE device in either the driver or DTS files. The correct
> compatible string is "st,stmpe610".
> 
> Fix the typo to ensure proper schema matching and eliminate the
> following CHECK_DTBS warning:
>   imx53-m53evk.dtb: /soc/bus@60000000/i2c@63fc4000/touchscreen@41: failed to match any schema with compatible: ['st,stmpe610']
> 

Missing fixes tag. This was introduced by conversion, no?

Best regards,
Krzysztof

