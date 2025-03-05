Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C623597E
	for <imx@lists.linux.dev>; Wed,  5 Mar 2025 12:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741178768; cv=none; b=EHcMLln9KRka+ofnPOjDyOV4sAotB851q358c5Ni634TYuOgrfFB8/APKf5Q2XNNjvaTBeNlvbbmn/hJYaOGz047L/tHrAaC1+fTgpVfqvzYnCkRgUcXNQ324m1YS7P3xj0RXlmspmWPHtjxMKiuoVlN3bDJ3HvaE9fBCpc4JHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741178768; c=relaxed/simple;
	bh=xx8JpjJPC8xYDKoDVOJwNq5GyjLhOLnf6u0v8a2NSeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IVyLfY9T8p5ADf+tTevA5xMs39RR9snFdoLdNYjo7lkTFwS6u/N2HT9aCQGWe2yVx4pIbfVd8t46Zhq3RhSJ6nRTJZbPyxvSB+RGnqF2A9ZTyrZeIkXPjOimW33U4RlFP8c7Xa352AwJEdtfzfLs92KaWv85d95ZpLWCsajXlYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXXefX/R; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXXefX/R"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-223594b3c6dso117136325ad.2
        for <imx@lists.linux.dev>; Wed, 05 Mar 2025 04:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741178766; x=1741783566; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZhOmEpDhm76SJPq5OYpOzDDF0g2lT4rBhjCoTGHE34=;
        b=FXXefX/RQCeJchVpFIEKVYutx+xjh9iCnce31XnxbjWB/38QoI5WhocomKjfGQ85r6
         WTOGVnuzTr0IpWC9IyCEePLEt3G1xcamG9oOTyL51iAOsrtvK4WrqxGTuhbkFjjupltb
         rKyHMmCXwA6bE4ILY6s8imcZEKQrqvDQpk+aRLGzVPjKI43MMja+kSEEvZ0rvGC+iY2D
         8saULV1G/fQodtQVb3W3n3Jmes/hVuG5DeryP9BEbb3dokK1hsSJQVThUvl+ZFooBKQk
         ZfJSZbfPZo33XGz0i12kI1OaWofE4zd1N5YPRRJvsgRfZfQIvXFOT7lgOoxHJ8YvLwr7
         KWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741178766; x=1741783566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OZhOmEpDhm76SJPq5OYpOzDDF0g2lT4rBhjCoTGHE34=;
        b=AYKR00FNP9/nYXhil4TEpbpqRdeWOyQax6gWUPhIWJ04AKJSNIMVbBKRcqfmMThQ7V
         rjpqBSG4ErqIvfcNce1voDW1xckCG5bkmVksXFEefSPNwGXO5nLhujKIWdE4sCjLJTcC
         TRJsNH3cJ35nCJGv+1JrLNhxL9z5JuCnbxXE22GRHyj6jA83ZH/7lY8kZnQ4JFGlMcpA
         OpoA73Avy2td3ESdveGtuN8EqOvzmgAUaajtDFOEgGTFAr+KShsX2tR4u8mWQwZGM/9l
         ghFjgdRj2vnQgeetYKymTCQKXNUBQjDj4pibVS7AMFtZH1Zc/woGmKNXe0SjMPDgJPq1
         2q+w==
X-Forwarded-Encrypted: i=1; AJvYcCUYZ1D30GELzRyefi8YpPCD9wtoP1JyGzCD8Os6nl4ojhRIRkgv7d9DnmeEM1g12lcAf3s=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPKZrw9/k7hRvkm2pjyTsLjUCi7PCpfDEaE+kb3GEVFbd7F+N+
	lriwLIDEkC9+8mIDjDg4L6fjcd8FP1d4wJzrHI09pnoTT6y4Ul77Rbf3UvVLtocPyCPwR3sho8l
	da2KvU4054fwqn+IBuH+vhYTqhIE=
X-Gm-Gg: ASbGncsTEUUXfOhYCPvsT/XCCkETHPkEFzpbmrBH3ye4k+Zy6i/yeBmzcxYLNkHZyW4
	JFgKqsJpAzvwzBQW2X/MN1bBJ5YMeGurYbEoCUMwYY8JywqDhM0ASzxGVvXe4LQfQ6uDpek9nET
	Vu/Rt3KATaJDWQLUrba/lLNio=
X-Google-Smtp-Source: AGHT+IHdwW4hQa2cLPlWYrU5ue4mWciZc0p5rQqeJ2JBGI1XN4w7WGoKToi7KE7C9eD7Ld4Askkac6qqdMHiE8X06ik=
X-Received: by 2002:a17:902:ebc1:b0:223:f9a4:3fa8 with SMTP id
 d9443c01a7336-223f9a457bemr25544855ad.19.1741178766361; Wed, 05 Mar 2025
 04:46:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250304162136.1963384-1-florin.leotescu@oss.nxp.com>
 <20250304162136.1963384-2-florin.leotescu@oss.nxp.com> <Z8cp1xoIXT8lgD8T@lizhi-Precision-Tower-5810>
In-Reply-To: <Z8cp1xoIXT8lgD8T@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 5 Mar 2025 14:47:45 +0200
X-Gm-Features: AQ5f1Jq_yZI7Qka024KvL_NkiadJQvrOZEyL3YURWLhpyxIxGw7rSu6jJaSDwjY
Message-ID: <CAEnQRZCT4vfFBApv+C3Wp17Fk0-Rwx36h4eCTTygaXFYFipEGg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: Add Microchip emc2305 yaml schema
To: Frank Li <Frank.li@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: florin.leotescu@oss.nxp.com, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	viorel.suman@nxp.com, carlos.song@nxp.com, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, festevam@gmail.com, 
	Florin Leotescu <florin.leotescu@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Frank, Conor, Krzysztof,

Thanks a lot for your comments and help.

In this initial patchseries we only add minimal OF support and
introduce a minimal binding.

> How did you pickup the maintainer entry?

We got the author of the first commit for
See 0d8400c5a2ce ("hwmon: (emc2305) add support for EMC2301/2/3/5 RPM-based=
")

> If only one reg You can go through trivial-devices.yaml

This is not a trivial device as we will add some specific properties
with our next patches
(e.g polarity etc)

> Missing descriptions of the fans, no?
> missing $ref to fan-controller schema.

Do we need to add this now? As this is only the minimal binding
support. We want to add that
in a follow up patch when we go into specifics.

> The emc2301 label here can be dropped, it is not used.

Will fix.

> The nodename should be "fan-controller", not pwm here I guess.

Sure, will fix.

On Tue, Mar 4, 2025 at 6:56=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Tue, Mar 04, 2025 at 06:21:34PM +0200, florin.leotescu@oss.nxp.com wro=
te:
> > From: Florin Leotescu <florin.leotescu@nxp.com>
> >
> > Introduce yaml schema for Microchip emc2305 pwm fan controller.
> >
> > Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>
> > ---
> >  .../bindings/hwmon/microchip,emc2305.yaml     | 43 +++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,e=
mc2305.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/microchip,emc2305.=
yaml b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > new file mode 100644
> > index 000000000000..cac0075a65bb
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/microchip,emc2305.yaml
> > @@ -0,0 +1,43 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/microchip,emc2305.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Microchip EMC2305 SMBus compliant PWM fan controller
> > +
> > +maintainers:
> > +  - Michael Shych <michaelsh@nvidia.com>
>
> who is it? look like not Microchip and hwmon maintainer.
>
> > +
> > +description: |
>
> Needn't |
>
> > +  Microchip EMC2301/2/3/5 pwm controller which supports up
> > +  to five programmable fan control circuits
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - microchip,emc2301
> > +      - microchip,emc2302
> > +      - microchip,emc2303
> > +      - microchip,emc2305
>
> According to your driver code look like all compatible with microchip,emc=
2301
>
> oneOf:
>   - enum:
>       - microchip,emc2301
>   - items:
>       - enum:
>           - microchip,emc2302
>           - microchip,emc2303
>           - microchip,emc2305
>       - const: microchip,emc2301
>
> So your driver just need one "microchip,emc2301" compatible string.
>
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        emc2301: pwm@2f {
> > +            compatible =3D "microchip,emc2301";
> > +            reg =3D <0x2f>;
>
> If only one reg:
> You can go through trivial-devices.yaml
>
> Frank
>
> > +        };
> > +    };
> > --
> > 2.34.1
> >
>
