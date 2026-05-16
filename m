Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA86405C31;
	Sat, 16 May 2026 09:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778924899; cv=none; b=eD1GfAbVpQzda0LljumYYVzG3zXi4hIVc8w1mpe2bJgvmgwXRdwoPZUTol+YNJBMf7dQPzXrpZ0CsJTG0XXnVb4VR34SUSp6wq155gJizYaocYXgiBhtDc6L9RS4VMshAclD4pybltHaFcHYNUJuePPgdyzI9gNUqV3Yu5ao7/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778924899; c=relaxed/simple;
	bh=GMEbDAIzdQ2hXeXKUawK2V5xvfKIsnx6HU6ur9Via9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lazFjmi4N5lpiYQVGJ55u9RYOcd3kzZmxj2/rnu04O3DypZNEKGMBYDff6qqS4W6zUCE4JG6/qhgUYTNHGE4ryTL7/qZDpMhhdwqAWw80dtDo7rzkwEyhBLaPm4Otc5XLz61Tyk6Qxgc3vRBCLMGAUoNI40zNxGyYsaJ8sBD0p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IkgF1hvT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkgF1hvT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0BFC19425;
	Sat, 16 May 2026 09:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778924899;
	bh=GMEbDAIzdQ2hXeXKUawK2V5xvfKIsnx6HU6ur9Via9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IkgF1hvTkzoyAWuWIWAL1wbwTbgwLjH+7Fw1mq/PSCKgeuE6+JhAmjxhqKLF4Xmhb
	 /nTKxFm9OX4bCMSjjKRgp6F1Plykj08xGLImrDUcIYcmYeIa1n+ZfgWqGUCyW5z0Tr
	 eDfPVmysmCZS4Bwb1nvgVwXToNV07smkb9jMyYAjKMvp3NLhI0s7vOoywBFR9mP/Up
	 +MlW4sr1bSrFuMHUBqTO/IJ6V6wcVcBiIXRhN3CtCoeQbQ0i9Il9ds3aBgJAI0U/k9
	 87tNKbb33j1McFl1LrMwlXx0W9+kCNoIq4quDIyKwy4PYxFiyUdF+jHqmC1Yw8i9aC
	 jLb5/wjiO3mIA==
Date: Sat, 16 May 2026 11:48:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	"open list:VOLTAGE AND CURRENT REGULATOR FRAMEWORK" <linux-kernel@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] regulator: dt-bindings: convert ltc3589 to yaml
 format
Message-ID: <20260516-fascinating-tapir-from-lemuria-7ac5ba@quoll>
References: <20260515150657.1731008-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515150657.1731008-1-Frank.Li@oss.nxp.com>

On Fri, May 15, 2026 at 11:06:54AM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Convert the Linear Technology LTC3589/LTC3589-1/LTC3589-2 regulator
> binding from text to yaml format.
> 
> Additional changes:
> - Add existing optional interrupt (drivers/regulator/ltc3589.c).
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

