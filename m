Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB9F175D53;
	Thu, 27 Aug 2026 16:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787847051; cv=none; b=cNMC5BKoM0dMmSgLUcpSbSPVgxnFLVQHnnvaHO4aK7+xro6Ea8M34Ot0QA+vzk/i6xQwA3jMhEhPS0bAwNpgqs7AQMiVpk3SBEZtKB8Zpck7o3mUAOBwgQwpgmRbSnmhAMEP3izP4fOn5EtGEB87jrge/wNT1jZi0g4XwnxWZhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787847051; c=relaxed/simple;
	bh=KfoR4mhfWbetepHo7OtCij//62ABrZhcr7eb5E1xdaM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TszuRpVxHJ8h+GGq1/A+j+e/cPTtdL6at67y5D11ozZuAhdvTq5UZkt5PWSkjQJ8zGCbcgzUyOOjCcV666bLP1vJaUHlgEqdUpBroeLqwosCrYaJRPvIZSUKsBTo3M8iLj3eDHGjBOmdxdM2crX/uO4HBQS4+YStEIKBljX6T0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGHeJhog; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGHeJhog"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7121F000E9;
	Thu, 27 Aug 2026 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787847050;
	bh=qCWzwezLjBy2RHM3CXS4veEdO4brykh/V9miA67S9qI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QGHeJhogip0mMuMv+D7Te0AriAhiIJy8aN9hZc5wpYZIJXqVJqsv3o1nEzwTFVVC6
	 0D0XIgqK0MxbXIf9Lf3qb6NELC/n+A+g67XCfVQiQOFA+OvQ0pcAtk+IfQdh1kCzHO
	 vgHk0nnb7OQgrNLE9PLQJkq/5Rcv+w9YH3C/L/gluxADxQxIvlNZg4ELVXUf7yXKRW
	 UHJgddAB/fgmBL8569Z1fHtnX1c6+2Nt4KqDF3wpY0egiBGN/XKTTzP5/5amuMPZfm
	 k9bKtOCgrLy6A666oZS2ftzn27UhsWqIlstapqp6kHlE4FNe9ES9tzr1UQMsF7uUHK
	 VmTFmHwkzCIWw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/1] media: dt-bindings: tc358743: Convert to YAML
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260827160312.4113159-1-Frank.Li@oss.nxp.com>
References: <20260827160312.4113159-1-Frank.Li@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 16:10:49 +0000
Message-Id: <20260827161050.0F7121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The YAML conversion drops the explicit hardware constraint for `=
clock-lanes`, allowing invalid device tree configurations to pass validatio=
n.
--

commit bdd5e3e786c51b25dcbd6765b03cb6736dcbf134
Author: Frank Li <Frank.Li@nxp.com>

media: dt-bindings: tc358743: Convert to YAML

Convert the Toshiba TC358743 HDMI-RX to MIPI CSI2-TX bridge device
tree binding from txt to YAML format.

> diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358743=
.txt b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
> deleted file mode 100644
> index 59102edcf01ea..0000000000000
> --- a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.txt
> +++ /dev/null

[ ... ]

> -Optional Properties:
> -
> -- reset-gpios: gpio phandle GPIO connected to the reset pin
> -- interrupts: GPIO connected to the interrupt pin
> -- data-lanes: should be <1 2 3 4> for four-lane operation,
> -	      or <1 2> for two-lane operation
> -- clock-lanes: should be <0>

[ ... ]

> diff --git a/Documentation/devicetree/bindings/media/i2c/toshiba,tc358743=
.yaml b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
> new file mode 100644
> index 0000000000000..29dd1d58f766f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml

[ ... ]

> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml#
> +        unevaluatedProperties: false
> +
> +        properties:
> +          data-lanes:
> +            oneOf:

[Severity: Medium]
Does this conversion drop the explicit hardware constraint for clock-lanes?

In the original .txt binding, clock-lanes was required to be <0>. Without
explicitly defining clock-lanes with const: 0 here in the endpoint properti=
es,
an invalid device tree specifying a non-zero value for clock-lanes will
incorrectly pass schema validation. This happens because
unevaluatedProperties: false permits any value up to 8 as defined in the
referenced video-interfaces.yaml.

> +              - items:
> +                  - const: 1
> +                  - const: 2

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827160312.4113=
159-1-Frank.Li@oss.nxp.com?part=3D1
