Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9EB1F7910
	for <imx@lists.linux.dev>; Thu, 20 Feb 2025 13:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740057107; cv=none; b=TlKc1fittApTZq+TiCs7Iu6FS7Kur2Br2Rn0u+1ujqBbqZkCKj6ngGtwLTPIhEhVymSuhRUEypG8C3fE536Wo5Alcl+ooWASb9GoEYxgNrQAvQMcZX55TUOxiYrK4k6VeUpIA0Fhx/D/sns4PS7cNH/TPlG065yqSgoqQu5oQyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740057107; c=relaxed/simple;
	bh=1rFDlxPm9dOSxZVbvPEae5HPKIG7G0vod8A15RjRzcQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uKoUfpwWzubf1odb0yJJrPnrfb4gXfnoHSuk1zp+l2TR7bgidjakm+4M3R/T4/X7Dt1tXomEfDUKSCjVpZuN7Sb1j1pXIh1OGBjNWb6KpDHyRTcVKkIrSRYcKJiUPyNHPrssjlUkxNMltNAxTznxFxU8NDGpYMbT3iOkX/8UXXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZlwRDcv; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZlwRDcv"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fbfa8c73a6so1789940a91.2
        for <imx@lists.linux.dev>; Thu, 20 Feb 2025 05:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740057104; x=1740661904; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JF5QN09m8wD/DAxZp57pL5p7sOu+zrVbutsLKLdh4Cc=;
        b=HZlwRDcvJROEPjK3BzgyiXO+2qPwcHtoEGs0CUgEhbAEZQg1SAlzQOiGF+VhJr5Lql
         keonaKsYzeYJlYicJoFbhLJX8fiA+13V9s7WvbXIMODmb7NYVzLzNW4OBWirGUSBhJdB
         RCXKlg+RZ/lXwaD7FTfECLcgM3H6hWmegImjWt6ZffPI7pYg9CcBU3mUfCgg3imn1svG
         cWgz5hbeDaJPtkHcZo5KpwfD2pZzPyHs0rXdQVmntMoveEGxGH5pQWVufhzOyaTHHQqZ
         AvuZvdpW3XrAqBJ7dAWU+YEvI7W4SB0ZVnZA4nQVA9/pv4BLpI9AU6SmaWPGbRG1Kqea
         UUWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740057104; x=1740661904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JF5QN09m8wD/DAxZp57pL5p7sOu+zrVbutsLKLdh4Cc=;
        b=rIBsNHBS3gKjGIAOKdf7wUeyGtGQ4AQkyTDW8uyaI2qVbItRWKZdKhlefV1mkOZDln
         Zf5+91oz9DZMLMRwDez+DJ+9+H3u7q8DQbNpqWVVMbW9N3qY9ZuFtfo9IGQghih22/NP
         47XMjUY7BV/i9qtbKLeenEq+cuwpj2UwVXQMg6UXsYk4nE3BluvK5GIEqnOoxhi3Lqz6
         tQdcXtEi94crNsn+UAy1tnrDG0DrsDnzYLpGWrQ1FUcDpDvqc4FXyTY/TshukgK67zNL
         VTyy+W0kv3NXfGKtrDJadbF4Hwv4SHkcQOIRun7fGpqhrpzKRyKtOmDiaxpFPXH7pY1x
         Xr0A==
X-Forwarded-Encrypted: i=1; AJvYcCXqlDeD2djiDeQeEKN2Y8ShX+sdfF76pFbbTn6fjDrsjyh+Tk5LLUdS/O+dL2WcnNfwT0g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQlga/pvUr0ApqvBXqWEwRP/1KKBsjAhgEDwuLcIDgJLoKcsq+
	mUQrO8nmBCdmkmChNcVmnfxe59r8jEyofncz5uNvtvcWji/fslhwrDPZXPK72IhzW09kqyclf78
	lSi5588m3t5LXaI474ABferDI6lw=
X-Gm-Gg: ASbGncspJaStwhrpr2O1ZXprcoTLyjFOU+dSgabyBmJmLhrBRMFHkf768NV6I7IJjOB
	PcnMvLHA+5qTVEt/pQd7Fl6SbGKxLPsE6XReNmnWE1OvrKJTZn59Blp8W1tLEmvS0kMo9sYtfGU
	ja4y7f/Nyen/2YPDxh5L2inD0l/zQgQJY=
X-Google-Smtp-Source: AGHT+IF6yx7qrSwJDRsToFTnlYa/h0A1YhshZSR5dL4PvWKAo3vckuyvm/Wyqi6jEyYBH3tHibJkW5A+JtSeL88Uo4M=
X-Received: by 2002:a17:90b:2f86:b0:2ee:ee77:2263 with SMTP id
 98e67ed59e1d1-2fc40c1d548mr36337290a91.7.1740057102215; Thu, 20 Feb 2025
 05:11:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250219192102.423850-1-daniel.baluta@nxp.com>
 <20250219192102.423850-3-daniel.baluta@nxp.com> <12614210.O9o76ZdvQC@steina-w>
In-Reply-To: <12614210.O9o76ZdvQC@steina-w>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 20 Feb 2025 15:11:30 +0200
X-Gm-Features: AWEUYZlFjxlk4pWxNFB2rtjCHWnzpKUBBv6ujaPIet0mutNPJ0j906GL3_pdrJk
Message-ID: <CAEnQRZDU9HoiD9uBNi+inrZcn8KCRp3pUZQfRqaq5kauuxOi6Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: dsp: fsl,dsp: Add resets property
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: p.zabel@pengutronix.de, robh@kernel.org, shawnguo@kernel.org, 
	linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	mathieu.poirier@linaro.org, shengjiu.wang@nxp.com, Frank.Li@nxp.com, 
	peng.fan@nxp.com, laurentiu.mihalcea@nxp.com, iuliana.prodan@nxp.com, 
	Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 20, 2025 at 12:37=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Hi,
>
> Am Mittwoch, 19. Februar 2025, 20:20:56 CET schrieb Daniel Baluta:
> > On i.MX8MP we introduced support for using a reset controller
> > to control DSP operation.
> >
> > This patch adds reset property which is required for i.MX8MP.
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  .../devicetree/bindings/dsp/fsl,dsp.yaml      | 19 ++++++++++++++++++-
> >  1 file changed, 18 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml b/Docum=
entation/devicetree/bindings/dsp/fsl,dsp.yaml
> > index ab93ffd3d2e5..923e7f079f1b 100644
> > --- a/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > +++ b/Documentation/devicetree/bindings/dsp/fsl,dsp.yaml
> > @@ -82,6 +82,13 @@ properties:
> >      description:
> >        Phandle to syscon block which provide access for processor enabl=
ement
> >
> > +  resets:
> > +    description:
> > +      A pair consisting of phandle to audio-blk-control and an index r=
eferencing
> > +      the DSP Run/Stall bit in audiomix registers.
> > +      See include/dt-bindings/reset/imx8mp-reset-audiomix.h for each i=
ndex meaning.
> > +    maxItems: 1
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -164,6 +171,16 @@ allOf:
> >              - const: txdb1
> >              - const: rxdb0
> >              - const: rxdb1
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx8mp-dsp
> > +              - fsl,imx8mp-hifi4
> > +    then:
> > +      required:
> > +        - "resets"
> >
> >  additionalProperties: false
> >
> > @@ -220,5 +237,5 @@ examples:
> >                 <&mu2 3 0>;
> >        memory-region =3D <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
> >                        <&dsp_vdev0vring1>, <&dsp_reserved>;
> > -      fsl,dsp-ctrl =3D <&audio_blk_ctrl>;
> > +      resets =3D <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP>;
>
> Am I missing something here? fsl,dsp-ctrl is used to get the regmap from =
syscon.

fsl,dsp-ctrl was used to control the DSP. This functionality for
imx8mp have been now replaced by
using the reset controller.

The example where the diff happens is for imx8mp so for this reason I
changed it to use the
new way of doing the rest.
