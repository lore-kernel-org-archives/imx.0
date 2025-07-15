Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA8A273802
	for <imx@lists.linux.dev>; Tue, 15 Jul 2025 22:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752617162; cv=none; b=S0Y23llWXKkJP5w8ZPT0UUq7uw3W53LpVeYlg9hd0sRvd0ueMX22dU0GZwEMI2YfLBhP50xqSeeo2K/7uq5By388BbxrNHnQy5te/o+NMS7i7cvony6du7cKYGdY4y9lQoo5GCHtA8YCKkJiEwWIyxBq4mjBI1W1SNp3fb0aBB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752617162; c=relaxed/simple;
	bh=fjHrp1hi2e7lQl5EJbxV1CIVLNPqYf16ns4CV/R8u8c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tgkCKD2UJ5dtOmg/LMoTJSChuAgkw+7slvgJoCnZeiie5l87btl0ax8LWFez0jHMrATOfTzliHeapUwA0/KPx+CEdH0JNk6YFgvF/uJWeVhUHWLh0e1RuRe7EQulbigobo0/9IzudNyr/7Gc7VhcUSW2q8mfl5MohKeDzS6Tq5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E50JgfO8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E50JgfO8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9171FC4CEF7
	for <imx@lists.linux.dev>; Tue, 15 Jul 2025 22:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752617162;
	bh=fjHrp1hi2e7lQl5EJbxV1CIVLNPqYf16ns4CV/R8u8c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E50JgfO8QZ6XUBe7EESU/9O3jjaflXeCB8qS4f1NgNpzZc7mgtPshvbxbkQOV/gkn
	 XjKBXEyNRbefdyN5p10gOM38FQ/gdurSNWLV69gFtv6C23pr1tlWRV9SKMkYGEw/O2
	 5rewty4ior3rsYvAcXQR33KSx0CWxPmQNcrxMHpvYEpZ/pLAGbiIrOUMqOEFWZ9gcW
	 2H+ACb3DRYK/OQu5ZJKDkUeaZO4zGZDDpSCB504G8aKCfB4olKN8RhElw1+72FLDL2
	 WxoWATmHK4ax0A0/k9kOwy4ibiKkoRtr2WXAdwJU/3hC4Z9oZ2QmdV4hJd4S4lav9x
	 FbK/oXkHv4Z+Q==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so11261801a12.2
        for <imx@lists.linux.dev>; Tue, 15 Jul 2025 15:06:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUxnq4iR40Pgpxk++OVKCJeSTl7+WpuZWGfXUG0tH2F+CF1pTKrEgHXgd97Uo8oVcc2a9w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3i4Y+jLuBFxT5MeTdUcoUDIJPa3dSowXh5WGT3/kZ2EfBxGWt
	iFcWMwUgdAi6K99Mb4dlcTmWyP9k6M3moNpIEuV+ewUnn+LIsx7FXklm8aduOkldKLA9Jt+JNxr
	J01dJUuygk4GFKcMYm9ry/dKiH8/F+Q==
X-Google-Smtp-Source: AGHT+IF3THyGxSpDJB2zcxXCRHWbO25l/G12eksSmO/uYuzWLaYP8QlRX+UYFpPVo8hKh5sovlhTnoBBmJLvznwlKqM=
X-Received: by 2002:a17:906:794c:b0:ad8:a4a8:103a with SMTP id
 a640c23a62f3a-ae9c9959522mr111997866b.4.1752617161059; Tue, 15 Jul 2025
 15:06:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aGLRbiqT8qVdG40z@lizhi-Precision-Tower-5810> <20250630183041.GA17697@pendragon.ideasonboard.com>
 <20250715195404.GA1794419-robh@kernel.org> <20250715213603.GO20231@pendragon.ideasonboard.com>
In-Reply-To: <20250715213603.GO20231@pendragon.ideasonboard.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Jul 2025 17:05:48 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLUj2h1OxUokOGFL34czroJnJ33cpvn9jO8b8=cu8Fz0g@mail.gmail.com>
X-Gm-Features: Ac12FXyxIIs_HYhTopUrR7-09MWaLsy_6FCW2sFDo64hGN05P4tIBsNB1NbkmgY
Message-ID: <CAL_JsqLUj2h1OxUokOGFL34czroJnJ33cpvn9jO8b8=cu8Fz0g@mail.gmail.com>
Subject: Re: Compatible vs onnn,model at ap1302 binding
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Frank Li <Frank.li@nxp.com>, devicetree@vger.kernel.org, 
	inux-media@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 4:36=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> On Tue, Jul 15, 2025 at 02:54:04PM -0500, Rob Herring wrote:
> > On Mon, Jun 30, 2025 at 09:30:41PM +0300, Laurent Pinchart wrote:
> > > On Mon, Jun 30, 2025 at 02:04:21PM -0400, Frank Li wrote:
> > > > Hi Rob:
> > > >
> > > > There are long discussion about AP1302 support.
> > > >
> > > > https://lore.kernel.org/imx/20250623-ap1302-v3-0-c9ca5b791494@nxp.c=
om/T/#m9ecad9fcbfd1ac1c59b3aa5737e3860a64db2eb4
> > > > previous thread
> > > > https://lore.kernel.org/linux-media/1631091372-16191-1-git-send-ema=
il-anil.mamidala@xilinx.com/
> > > >
> > > > Let me summary the key points.
> > >
> > > Thanks for the summary.
> > >
> > > > AP1302 is I2C ISP processor, which can connect to some RAW sensors.=
 such as
> > > > AR0144. AR0144 can work alone, a RFC upstreaming at
> > > > https://lore.kernel.org/linux-devicetree/20240630141802.15830-2-lau=
rent.pinchart@ideasonboard.com/
> > > >
> > > > When AR0144 connect to AP1302, it is not 100% transparents for soft=
ware,
> > > > It needs power supplies for it.
> > > >
> > > > The basically there are two methods now.
> > > >
> > > > Method 1 ( Laurent Pinchart purposed ):
> > > >
> > > > use a vendor's specific property like model
> > > >
> > > > camera@3c {
> > > >         compatible =3D "onnn,ap1302";
> > > >         ...
> > > >         sensors {
> > > >                 onnn,model =3D "onnn,ar0144";
> > > >                 ^^^^
> >
> > Why is this outside the sensor node?
>
> Because when the AP1302 is used with two sensors, it requires both of
> them to be identical. The property could go to the sensor nodes, but it
> would then be redundant, and would make it possible to write incorrect
> DT. When designing APIs, one of my goals is to make them difficult to
> use incorrectly, so I think the property is better placed here.

Okay, makes sense.

> This being said, it won't cause lots of issues if we moved the property
> to the sensor nodes. I think it's suboptimal with no benefit, but if
> that's the only contention point, I can compromise :-)
>
> > > >                 sensor@0 {
> > > >                         reg =3D <0>;
> > > >                         vdd-supply =3D <&mt6358_vcamd_reg>;
> > > >                         vaa-supply =3D <&mt6358_vcama1_reg>;
> > > >                         vddio-supply =3D <&reg_1p8v_ext>;
> > > >         ....
> > > >
> > > >
> > > > Method 2 ( suggested by Rob at 2021 ):
> > > >
> > > > use compatible string:
> > > >
> > > > camera@3c {
> > > >         compatible =3D "onnn,ap1302";
> > > >         ...
> > > >         ports {
> > > >                 port@0 {
> > > >                         compatible =3D "onnn,ar0144";
> > > >                         ^^^^
> > > >                         reg =3D <0>;
> > > >                         vaa-supply =3D <&vaa_regulator>;
> >
> > Please don't hijack the graph binding (ports and port nodes).
> >
> > > >
> > > >         ...
> > > >
> > > >
> > > >                Method 2                              Mathod 1
> > > > The same hardware should use the         There are not driver to ma=
tch onnn,ar0144.
> > > > same binding regardless connect to       AR0144 is not visilable fr=
om host point.
> > > > which bus/devices
> > > >
> > > >                                          compatible means software =
comaptible, but
> > > >                                          there are not driver for i=
t at this case.
> > > >
> > > > reg in difference spi/i2c also have      reg is i2c's address, but =
here is port or
> > > > difference means.                        sensor index.
> > > >
> > > > Similar case for spi and i2c devices.    There are difference set o=
f mandatory properties
> > > >                                          when connect to ISP or SoC=
.
> > > >
> > > >
> > > > Rob and Laurent Pinchart:
> > > >
> > > >         Need a direction to move forwards!
> > >
> > > There are two things to consider here. One is the DT property we want=
 to
> > > use to identify the sensor model. It can be argued that the "compatib=
le"
> > > property is widely used for this purpose. This is true, but the
> > > "compatible" property is meant to indicate compatibility from an
> > > operating system software point of view (regardless of which operatin=
g
> > > system is used). As a result, it serves as the central piece around
> > > which drivers are bound to devices, and therefore is also used to mat=
ch
> > > DT schemas for the device.
> > >
> > > What we need here is to identify the sensor model, first and foremost=
 to
> > > load the corresponding AP1302 firmware, and to know which power suppl=
ies
> > > the AP1302 driver needs to control for the sensor. Note that it would=
 be
> > > entirely feasible for the sensor power supplies to be connected to GP=
IOs
> > > of the AP1302 and entirely controlled by the AP1302 firmware, but on
> > > some designs those power supplies are connected to GPIOs of the main
> > > SoC, and therefore need to be controlled by the AP1302 driver.
> > >
> > > While I think a custom property is better, I could live with
> > > "compatible" *iif* it does not imply at the corresponding DT schema f=
or
> > > the sensor is pulled in. The DT binding for the sensor when controlle=
d
> > > from the main SoC describe the properties of the sensor that are
> > > required for that use case, and those only overlap slightly with the
> > > properties of the sensor needed by the AP1302. Using "compatible" in
> > > such a case would in my opinion be misleading as it would imply
> > > compatibility with the sensor DT binding.
> >
> > Why not a new compatible (e.g. onnn,ar0144-isp)? Seems to me there woul=
d
> > be at least some overlap. If there are supplies, then the names should
> > be the same, right?
>
> Would that be a top-level compatible for the AP1302, or am I
> misunderstanding something ? Or maybe a compatible =3D "onnn,ar0144-isp"
> for the sensor node, not the AP1302 ? The AR0144 could be used with
> other ISPs (I recently upstreamed support for the THP7312 external ISP
> from THine for instance, which could work with the AR0144 from onsemi),
> so the "compatible" property in the sensor node needs to be evaluated in
> the context of its parent, not in isolation. I think that departs enough
> from the compatible model to be better served by a different property,
> instead of introducing usage of "compatible" with a semantics (both from
> the point of view of the OS, and from the point of view of the DT
> binding validator).
>
> > If you really want onnn,model, then that's fine. Probably there's not
> > enough different sensors for me to really care...
>
> The AP1302 is typically used with a subset of the onsemi sensors in my
> experience, so I indeed don't think we'll have scaling issues.

Okay, then stick with onnn,model.

Rob
