Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A8140EB99;
	Thu, 27 Aug 2026 19:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787857968; cv=none; b=lBZgrUi1kPBKCUexWnMWkdOphuP4hV+/fYDO2xyJfkSqQxNFN10Of3s/0pX/s3Ejm6zh3auSTslOYCZTzqDdueQO8+gRLxg1gmJ9SIwNG+a9ej70Ap0+8K/OSNefweLt08CWbSdXv5sPpMxEHwOLu45QMJWqpZCMF6enmLFqaMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787857968; c=relaxed/simple;
	bh=tDjUczhABnL+zCdhcLhDC7keYlx8DmhOzbfXUp4IZe4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U5Wyw4CUlBA4MbLM+jPFF1aSmYo8ut7atsicCP36Nngw1V19YXOncubomOT/x1giBX7OzgXX1CkObc8sXlbY2rBnazwfHJVP0EcscMaTYLFMEDWpEZNoZKp+qg+WIgqQ0C1ibH347ZqkMcxW0IVkXBCELut/B4UKtt+yysMkJRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5bJWW/J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5bJWW/J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4AD91F000E9;
	Thu, 27 Aug 2026 19:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787857967;
	bh=tDjUczhABnL+zCdhcLhDC7keYlx8DmhOzbfXUp4IZe4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y5bJWW/J6KafnhyAXMBJWcC6gpMg6mrSpToqAWW3JC8PH4wL6q2IuiOwpirgw4YjD
	 0hZhg+rfIYfkKaJAYfmf4sHIvhpcKHyZFlE6fvTvBlqhNnHP4VSUzTryv93i41lX/t
	 MkfY85gaRQA6jmYTHGvFj6guBHH66DA5FK1xdKzUn+QFmgu+XKb/9ksH71Mej2LIHj
	 lUp95xfv3oQusop4pW6X2O63B/xuz5wirhzye5HG9RNYAetggml6VZyD9ql1WWVi+O
	 awfsfEGUyZZSOprFBXT/dIgNihLdrKvI+2bJYamb4EvPsvAN2mk+vfEGON+Aj6A6il
	 4fUemvaeNT5bA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] media: dt-bindings: move ovti,ov2659.txt into
 ovti,ov8858.yaml
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260827190501.56673-1-Frank.Li@oss.nxp.com>
References: <20260827190501.56673-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 19:12:46 +0000
Message-Id: <20260827191246.C4AD91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] The commit message subject claims to move the binding into 'ovti=
,ov8858.yaml', but the patch actually creates 'ovti,ov2659.yaml'.
- [Low] The patch deletes the `.txt` binding but fails to update the refere=
nce in the `MAINTAINERS` file.
--

commit 87439fdf072810cc54b017765ea8976dde911644
Author: Frank Li <Frank.Li@nxp.com>

media: dt-bindings: move ovti,ov2659.txt into ovti,ov8858.yaml

Convert the OmniVision OV2659 camera sensor binding from plain text to
YAML schema format.

> media: dt-bindings: move ovti,ov2659.txt into ovti,ov8858.yaml

[Severity: Medium]
The commit message subject claims to move the binding into ovti,ov8858.yaml,
but the patch actually creates ovti,ov2659.yaml. Should the commit title be
updated to match the newly created filename?

> diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt =
b/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> deleted file mode 100644
> index 92989a619f292..0000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/ovti,ov2659.txt
> +++ /dev/null

[Severity: Low]
Does the MAINTAINERS file also need an update?

The patch deletes the text binding ovti,ov2659.txt, but it seems the
OMNIVISION OV2659 SENSOR DRIVER entry in the MAINTAINERS file was not updat=
ed
to point to the new ovti,ov2659.yaml file.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827190501.5667=
3-1-Frank.Li@oss.nxp.com?part=3D1
