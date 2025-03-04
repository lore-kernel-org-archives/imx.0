Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CAB1EEA36;
	Tue,  4 Mar 2025 10:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741085832; cv=none; b=XpHpxF0P+5Qj4LKRg68cA14bGs2vkEN8JuxzhYXXq98GwUs3xeFos8CYXDho0qUJjbOvBeTeWX25L6qhiwTHRroCUuzeESrT6/5F2azfO3jNcA+fOmO7EM7mwx77B+WifLvNBz9KL1InfxuUsoElCYFMjArVyO1PY3pW+AuYnik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741085832; c=relaxed/simple;
	bh=Uvkzu29Y8PUMAEcuNdr5Ez6in0wuHeIuBJMkRl6oCQM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=kHX3QYVN+ydfleNEzJuMFebxDOr4AbAZnF976MBP9BFvovzPHrLqWYzEUatf98PAZsvIz8ni1jfYw4xRhhv3gXY+mTrF6IU6yKeG13X9E7XiQ2hHG9VnfNX68Yu2PaBX72BEyPA1n1FPVC9/T06qn7t8s96uLnKVvMTbjltAfjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YIyUKJxP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YIyUKJxP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D3FC4CEE9;
	Tue,  4 Mar 2025 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741085831;
	bh=Uvkzu29Y8PUMAEcuNdr5Ez6in0wuHeIuBJMkRl6oCQM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YIyUKJxP1QiFVa39ZNliUPZUqE+mBxDuds863otU1QSxEG/kIDfZlii+GXo+v1bGr
	 Amz3O4YsNKPKtjcDlanJlT9Z6fY+5nGherJD7c5sCeY34T/piM2gXBBVnlOgK9INww
	 9UHMLJDWidn/TA9Khakir8hi6dgl0aX5F8cjWWGMBKEf6EcO49q7jsR/qfpnrqOXUY
	 7mjDDR7EVXIe4068pVDQ7qnYJzMOCM4yJv0ZMWfTMrRS/u2/KYkJrtG0Ro1ZgJR1sY
	 sKN0UAA21HVBXezAYetRAhgNVH//y1tNt7YOMdlxmQmEjTjmS4rmaZiLc7GcfYEe/L
	 S1S9R6BQBokcg==
Date: Tue, 04 Mar 2025 04:57:10 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, shawnguo@kernel.org, 
 conor+dt@kernel.org, kernel@pengutronix.de, frank.li@nxp.com, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, peng.fan@nxp.com, 
 aisheng.dong@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com, 
 krzk+dt@kernel.org
To: Jacky Bai <ping.bai@nxp.com>
In-Reply-To: <20250304093127.1954549-2-ping.bai@nxp.com>
References: <20250304093127.1954549-1-ping.bai@nxp.com>
 <20250304093127.1954549-2-ping.bai@nxp.com>
Message-Id: <174108583009.1693369.10518412306267353272.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: dma: fsl-edma: add
 interrupts-extended property


On Tue, 04 Mar 2025 17:31:24 +0800, Jacky Bai wrote:
> Add interrupts-extended property for edma that has multiple interrupt
> controllers used.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  - v2 changes:
>   - newly added entry
> ---
>  Documentation/devicetree/bindings/dma/fsl,edma.yaml | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/dma/fsl,edma.yaml:102:5: [warning] wrong indentation: expected 6 but found 4 (indentation)
./Documentation/devicetree/bindings/dma/fsl,edma.yaml:104:5: [warning] wrong indentation: expected 6 but found 4 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250304093127.1954549-2-ping.bai@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

