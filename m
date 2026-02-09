Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690061FCFFC;
	Mon,  9 Feb 2026 23:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770680998; cv=none; b=g7ndaWt4rqD5bFetTOXQZ5wx2ZAJHfkFIrTDYGcCn2/1J0uVGi2REWtv5yFjRhjaVYWHpy9y6TZojUsnWLQ0gnJn+D8QfxMawz49w0T4VDzalgulRFCaKZ6iJoKiDI6tKAEmR0wKwMGbf9ZQKxA93emQBPxlw9sB5082V6d5780=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770680998; c=relaxed/simple;
	bh=vthna5J6mcJHxTUZOiw5hMuMG+eyenteh/f96scOytc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHFR9hT8NbawAKouGCc/8pytSW6kvCy+YJc90rXPdLs27vWWr9mnr5/9zFfa4u46c1EcTr11q8lmjEAlImBVAy/EnCHHXl5mX8lTrK+oG2EZiAzGMx/axQl0w26QUA0OZYZQUfQo1tdQ86vY4OU8ygFzHncG+aj3vx9W1Gk4cPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=na2ui/mJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="na2ui/mJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF418C116C6;
	Mon,  9 Feb 2026 23:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770680998;
	bh=vthna5J6mcJHxTUZOiw5hMuMG+eyenteh/f96scOytc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=na2ui/mJAjOPf8vrz2drxJRpWRS/IQn/EM5JuqNqEGn8Zf9/KhGnbsEaMtwPw2cwy
	 lu4glidiLNDJXLJlrDRoSMQf+6FPWJM3lK3q0NDnMFKWvaE08eht+X0Kew5OVLmSJS
	 kg75vjLWokhhx3GqXcQPUl4dydtAnkXq9PiRiZhp9XomWc/qBMsfmS3Uh8F9DM2qUZ
	 FQOaYmOkz9b1SU/1rrn86k9ocNqXRS1OjHwOSzoXQ8p7UbOb+zNOy5G/fNUFtVB/Xq
	 V7RTIdiyIyCZn05hPIf/tYDyUAllw2TVHuIkFA7ry5VhEE/pV3g9riaBAUy5rR67dU
	 1DAFy5my+ftkQ==
Date: Mon, 9 Feb 2026 17:49:57 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:IRQCHIP DRIVERS" <linux-kernel@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: interrupt-controller: Add compatiblie
 string fsl,imx3(1|5)-avic
Message-ID: <20260209234957.GA2132911-robh@kernel.org>
References: <20260201012103.2422917-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260201012103.2422917-1-Frank.Li@nxp.com>

On Sat, Jan 31, 2026 at 08:21:02PM -0500, Frank Li wrote:
> Add compatiblie string fsl,imx3(1|5)-avic for i.MX3 SoCs (over 15 years
> old).
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../devicetree/bindings/interrupt-controller/fsl,tzic.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,tzic.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,tzic.yaml
> index 5f2c8761a31de..34aa6b0517633 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/fsl,tzic.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,tzic.yaml
> @@ -12,6 +12,11 @@ maintainers:
>  properties:
>    compatible:
>      oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx31-avic
> +              - fsl,imx35-avic

What about imx1, 27, 25?

> +          - const: fsl,avic
>        - items:
>            - enum:
>                - fsl,imx51-tzic
> -- 
> 2.34.1
> 
