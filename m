Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9040C210F4D
	for <imx@lists.linux.dev>; Tue, 18 Mar 2025 15:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742311902; cv=none; b=RVUUvoD1EIocTCuyEQMlCJSxqEWmd9jWxYmcTT6srnFcqbPCCZGByTsPnVk2Gj02qZiUQ9oticpjd8vjJMHACdlleMSlEpmqSLC9+lRAJg3PFjAl/Pfcu8GjObe+fSnmd94svAgVVvDlt2PlJ5EjOlxwq2IfGbcYdnGAgnEdUUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742311902; c=relaxed/simple;
	bh=XoyQyut0B0I09grFpiG22mcD2dPJKh7wdni3ku4Ykks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UGeh1/7hRAcQC/x7I5Xlo92GAQOSqmab562n9Ur8WJ+vXjZJ1Ul8plp7w5HiJezE//hlLVgwY5lb9nHUabJUB0CqUy0iZhBY6rDElo3eCODwrPAhlXCnYP7+CmtHtmNmolZY290l7SOxBjtKJRrv2p7Yp6RM6zeyKc9OaSr+c6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GrCptF/h; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrCptF/h"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ff80290debso5236326a91.3
        for <imx@lists.linux.dev>; Tue, 18 Mar 2025 08:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742311900; x=1742916700; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GTo+P4IDj/egBTC39do6b+maTrxFfajRm+lC64dJAgc=;
        b=GrCptF/hHoa99B4qClIYK5tcJs+lCuNvozf2RPmVR4Uduv81sxgk5p7OFVwQRjZun3
         r8o+egMhFSCnzzNpe0gZbNRgbwltsFogZEebHBh7MFPaF9xd/yfXxVHa4uz9wVrzyV9n
         65sDiqdJkNuYpmb34mPsIYMa4DNuQY3idZL0Bqwg5P3jOhuLE2YgI5oLE3VRE0biRRM4
         +UA1dECJQo2GUO7ofOee6F7MEKGF09LcpErvX1AaW3RObtyBIMa5qmgnTU/ImptQPJw6
         Nik5vJyz+pGEf7+7UNmh7xk4OSFGAi89rFVTkLIsKV/kTWOrK9YTMKdh7nzvbQcEt6xe
         xUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742311900; x=1742916700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GTo+P4IDj/egBTC39do6b+maTrxFfajRm+lC64dJAgc=;
        b=R98imzLSS5xbbcd4s8SLal+ff1kQfz8/KQxO/f08lBZAV0qrUtoYdYgx0i4RqtxAwJ
         xNNdy3q+QajfMhtOiXiwB3Yl/sx//2aBYvNQt3hk30Ycf4R2qCBA3OjtA62U5lElLBwu
         qCBsMPE0dq3A2nmN9C+xmGBOEvqZTqf97aupG040dNH2lPyfovsaDM1SDSx9Op4qg1IU
         djEg7up8xQq4LWWJNUPHf/bVa4ujL5ySiArmOt+1rvkFg+8CzEp3NmXzysQLrZS8Gh0k
         To4Iz9vWIknfbMpGUh3jRxZk8BTc8gR60vy7SDCBjGTNaxQq6K/reAKlGfuL8yC9dCFT
         GImQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNDw02nk7LonGD5MTFvLUeE5tpc1az3u5nNqGfsrSc18d73khgLZfQ+Kod+A9ZvohEN8I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn4C7XFnzjL3GFxhG4pz6D1/cXqQ+HM80EMAVMt3Qym0LFHw9M
	3eutJhJDMIc58gqOMnfQAnlhvmIANbUY2QyGu/Q+pF7P9Cwd+KnFMCthxn8Xi3EHTnXsqvaMP/K
	mWjmjakLZvy2DtwRjef7vfaUOxSIeRVvolslEN+M/
X-Gm-Gg: ASbGnctruuZ9Wg4rrOWfMqZ1mXRBtyNLrXl+DexR9/RjvksmaxW2YKxjygJbNPWE6eV
	dAYDMRnSCptDRDtqFBZMyiRwqkObIscDLSiTPwP24Nxcc2C5UjLNFe9F6C54EgwU5Iz1/zSMIIk
	48Uw2JQtocprVX/ePUjiyPRrw=
X-Google-Smtp-Source: AGHT+IGev3FhJjE3AIdupTysEnxLQqIhHB0aNv4HFA4FSPqyJjajPwHMn95jdK7N+OLjNP3hIRsGSfPOM63dkEDBTf0=
X-Received: by 2002:a17:90b:3d86:b0:2ff:5ed8:83d1 with SMTP id
 98e67ed59e1d1-301a5b22c44mr3891136a91.19.1742311899758; Tue, 18 Mar 2025
 08:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250318085444.3459380-1-florin.leotescu@oss.nxp.com>
 <20250318085444.3459380-2-florin.leotescu@oss.nxp.com> <7afcd224-1154-4e2f-b383-10f6a89fdae0@roeck-us.net>
In-Reply-To: <7afcd224-1154-4e2f-b383-10f6a89fdae0@roeck-us.net>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 18 Mar 2025 17:33:12 +0200
X-Gm-Features: AQ5f1JrGT6OkXhZLmAGbs6dhzXtsxvJYdhcQucC_VGy8G_11v7e7DfbTPZDv1rM
Message-ID: <CAEnQRZBmYdLh29ha1FKz8=CbxjFBFFTgDkjrEmwTxW2WcxodfA@mail.gmail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: hwmon: Add Microchip emc2305 support
To: Guenter Roeck <linux@roeck-us.net>
Cc: florin.leotescu@oss.nxp.com, Jean Delvare <jdelvare@suse.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	viorel.suman@nxp.com, carlos.song@nxp.com, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, festevam@gmail.com, 
	Florin Leotescu <florin.leotescu@nxp.com>, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 5:22=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 3/18/25 01:54, florin.leotescu@oss.nxp.com wrote:
> > From: Florin Leotescu <florin.leotescu@nxp.com>
> >
> > Introduce yaml schema for Microchip emc2305 pwm fan controller.
> >
> > Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >   .../bindings/hwmon/microchip,emc2305.yaml     | 113 +++++++++++++++++=
+
> >   1 file changed, 113 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,=
emc2305.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.=
yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > new file mode 100644
> > index 000000000000..e61ef97e63af
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > @@ -0,0 +1,113 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/hwmon/microchip,emc2305.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Microchip EMC2305 SMBus compliant PWM fan controller
> > +
> > +maintainers:
> > +  - Michael Shych <michaelsh@nvidia.com>
> > +
> > +description:
> > +  Microchip EMC2301/2/3/5 pwm controller which supports
> > +  up to five programmable fan control circuits.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - enum:
> > +          - microchip,emc2305
> > +      - items:
> > +          - enum:
> > +              - microchip,emc2303
> > +              - microchip,emc2302
> > +              - microchip,emc2301
> > +          - const: microchip,emc2305
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  '#pwm-cells':
> > +    const: 3
> > +    description: |
> > +      Number of cells in a PWM specifier.
> > +      - cell 0: The PWM frequency
> > +      - cell 1: The PWM polarity: 0 or PWM_POLARITY_INVERTED
> > +      - cell 2: The PWM output config:
> > +           - 0 (Open-Drain)
> > +           - 1 (Push-Pull)
> > +
> > +
> > +patternProperties:
> > +  '^fan@[0-4]$':
> > +    $ref: fan-common.yaml#
> > +    unevaluatedProperties: false
> > +    properties:
> > +      reg:
> > +        description:
> > +          The fan number used to determine the associated PWM channel.
> > +
> > +    required:
> > +      - reg
> > +      - pwms
>
> Is it necessary to make 'pwms' mandatory ? The current code works
> just fine with defaults.

The code adding OF support is added just in the next patch, so the
current code isn't event
probed when trying to use dts.

Or am I missing something?

+static const struct of_device_id of_emc2305_match_table[] =3D {
+       { .compatible =3D "microchip,emc2305", },
+       {},
+};
+MODULE_DEVICE_TABLE(of, of_emc2305_match_table);

I have no strong opinion on this we could make pwms optional.
