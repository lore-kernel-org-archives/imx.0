Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B1C30C36E;
	Mon, 17 Nov 2025 17:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763401714; cv=none; b=FYZIq1oZHZSk5vlO0gwD2RaNig0uy9PpOM5kKSSeDCohUqWgzfMvdreaoPkrFto2sqU2ahH339Ymfzyc1LxI1iXcbNfNi2EvHTq9XYi02rzySQVH5xttt7KKlF9gcSBzWAa5xxeAtcPXSJueVGB2Qfg08YdLt9/pBrhh0OrvQWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763401714; c=relaxed/simple;
	bh=lvSuNGg9DmkuyoF5qDz0XoWE2/cvzkN6GAjf2FIjlIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TI4pUb5IkW43wqDyZ7M4W0kk7dhqB0qgXguspJcWaDy1/3+gygpmWe/zuepxRQDdBYYebTSRKsC0SULVDcF0AJA47agWkyEvitW8L2pi783SU8T9vAXW/w0Mx76sFt58oFWSf2LzUnywsCJwx9qTSIh927XRrt+j8en390L/dQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNL0EqzJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNL0EqzJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B04C4CEF1;
	Mon, 17 Nov 2025 17:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763401714;
	bh=lvSuNGg9DmkuyoF5qDz0XoWE2/cvzkN6GAjf2FIjlIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jNL0EqzJN4KhjlbO8ad5f308+x1h12Ify3Nyt0MY7nqTTYJZPVR1I20p4BNPyl4NW
	 J9MiHgxFXUzUTAq3r2FCSnnfohXXDEp1wO+ilEDIzCPeo7srqgHgKJsAAD0cJ8dAvE
	 kYC/FhG6k9HTx4qWOciKwmHut2E+62GRnH3hJZzLqZ6cXHMhGUIxV7EeFD+qDsFqtT
	 /jajl31GHr4L7jh8bXQegpQ8uC0Owx3eD7ml7SJ3RTzHIAA17PfJUvGPWo+F5cRPX3
	 ieEAYzDfmbWjjU7sKBH/1XaT67SdUBudw7q3WCgqork66wqeZioA4+03XmnD6oV7sQ
	 O46jk5FLy+bEg==
Date: Mon, 17 Nov 2025 11:48:30 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, Lee Jones <lee@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Support Opensource <support.opensource@diasemi.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: mfd: Convert dlg,da9052-i2c.txt to
 yaml format
Message-ID: <176340170928.221863.5229006309013357564.robh@kernel.org>
References: <20251114213037.1211907-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114213037.1211907-1-Frank.Li@nxp.com>


On Fri, 14 Nov 2025 16:30:36 -0500, Frank Li wrote:
> Convert dlg,da9052-i2c.txt to yaml format.
> Additional changes:
> - compatible string fallback to dlg,da9052 to align existing dts files.
> - Add interrupts property.
> - Add ref to /schemas/spi/spi-peripheral-props.yaml#
> - Add dlg,da9053bc.
> 
> Remove dlg,da9053 from trivial-devices.yaml.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - dont' fallback to dlg,da9052
> ---
>  .../devicetree/bindings/mfd/da9052-i2c.txt    | 67 --------------
>  .../devicetree/bindings/mfd/dlg,da9052.yaml   | 89 +++++++++++++++++++
>  2 files changed, 89 insertions(+), 67 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/da9052-i2c.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/dlg,da9052.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

