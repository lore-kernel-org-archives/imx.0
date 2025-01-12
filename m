Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8493175BF;
	Sun, 12 Jan 2025 13:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736688987; cv=none; b=NIznl7Gk3LiKBCG9KWglkRhzbEVc5zJ900G8gMGobV0U7NAx/SqIa8fe2CqfFHZmO2wgiurm42kiP65fvKSEJjhl6uGUOMu35xy49m2ed0DHop/V8/6YPQC1O0mhn+3zsFtUS09olOfkrA5MVJwNgnUipmnXsXl9/7BxbY1T0X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736688987; c=relaxed/simple;
	bh=QZcrZWvks66LVdzTQOYREinftqMEv37ZYZC7nabyMGc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=YfNx0tA13/29U635BRKXAEhNYzVmjlKwcyPlL6JvNwcpBD1irJirpS9mtHbWLnYLDLlrwruU9Ro4otheLpLvYOUpsWOznMwKuKjbEd99GGfzuaEzOWEQLnzkhEW4hp+pQSRrjpGg27csO00l/ZeKtAzjOzAxSnEmr3aIKKFLrj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WF1QK/k0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WF1QK/k0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22A1C4CEDF;
	Sun, 12 Jan 2025 13:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736688987;
	bh=QZcrZWvks66LVdzTQOYREinftqMEv37ZYZC7nabyMGc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WF1QK/k0pcSAWth0kTisAImgLfWO4kjyamVC+wBdQ5aXS9RpK99JQOxe1XQ9XlhDM
	 r2A7TGAxd7E5q+2k/436AK47nAy2G3MSUDZWGVlBpm9D/86Y0Vi+gytxE1Ov086h61
	 2bNAeak5aJEynjCo5mAVlNrYZ8pZIS1jJnMGl5kCTxG8dbWj//hYQuuyP0cGhQb30A
	 lN5MInbo46T9FhWyz7Sbli7+9h0WIKd/8rsIBwhGpTn/aRfsvbaOzOXNjjhDH8BiZG
	 9eigd+xnO6QXkfRabc7LX8ev9u42R+sEDP1INtwutJxUpko8MfOfc2RyV+YB1cNvQc
	 /pZCO1BBa0cyA==
Date: Sun, 12 Jan 2025 07:36:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@denx.de>, 
 kernel@pengutronix.de
To: Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20250112122939.988309-2-festevam@gmail.com>
References: <20250112122939.988309-1-festevam@gmail.com>
 <20250112122939.988309-2-festevam@gmail.com>
Message-Id: <173668898583.2984154.9988580107147542250.robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: clock: imx5: Fix the CCM interrupts
 description


On Sun, 12 Jan 2025 09:29:39 -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> On the i.MX5 chips the peripheral interrupts are represented directly only
> by their interrupt numbers.
> 
> Make the CCM nodes to follow this format.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
>  Documentation/devicetree/bindings/clock/imx5-clock.yaml | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/imx5-clock.example.dtb: clock-controller@53fd4000: interrupts: [[71, 72]] is too short
	from schema $id: http://devicetree.org/schemas/clock/imx5-clock.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250112122939.988309-2-festevam@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

