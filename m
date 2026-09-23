Received: from mail-ed2-f41.google.com (mail-ed2-f41.google.com [74.125.228.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C4B542EE8
	for <imx@lists.linux.dev>; Wed, 23 Sep 2026 14:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175413; cv=pass; b=IDhIIyDF2rt9O89I0HUqzUrnM87ydVLhOxPx6LIOuTt6ZDhjIHf0HA3fpEpJNlEyRtbikhas6YO+Oy6/wyxY1XV22eZxvSrcFS9lBrxU7byCDXxx+vj2YuileaVJLWNoacv96ezdaGFlF+wzU2d3CUgXUk3peq2E3OY8dpZk5/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175413; c=relaxed/simple;
	bh=UyMSLBvW9tmyx5OoI5WsB7xjvglDq4V9P7yAbnK27AA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ubq6UG07d2MrHlJbZ7I2FP2wB2krG2Y5jBCjneqHqx+zpGroFwc2/aEaYxgHwMvr9QkKOot8gLmdytHte3kC7NRtafhRk2eWC/hdxRABW6zgCSXV7zvbOqWaNuNhLjJ90AYgpnXoXkaAzq1UqCktJ72LHtcJnkVQCe4c5TpACGg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oyHvfVm0; arc=pass smtp.client-ip=74.125.228.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oyHvfVm0"
Received: by mail-ed2-f41.google.com with SMTP id 4fb4d7f45d1cf-6a99391ffb2so1875543a12.0
        for <imx@lists.linux.dev>; Wed, 23 Sep 2026 07:56:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790175410; cv=none;
        d=google.com; s=arc-20260327;
        b=F3LZDuiKf77yk1Ehj/v2sS6Ru6JQWrs406OVhxFsWQvUr2pG7e3KMDuqJ9z9JLFXOc
         9c80jZyuZ1UCFlVuNIvMxtT63lELvTo8aNFRiG/ydn9C247pWM54I36k9OTSvXCXGQoa
         IhQIqabAQt8vEg5bHhkalafmgM/ajohaApt85419qJLiQTfKL8pX6VsDURi8dC3fn16o
         qRkGIuBD09LPjhOrgg2O8MwPhHHiq3sUSDRwipNdvIIYd+1Vo39aO+37dfhCyGTJZ9/g
         4IwTn1oLS8DPu3cnqo+r2UR9v0XfLEWj7HAWl1mddH6I2QutB5x7EU3SWssVAwjE8/a7
         f6vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=80Q/UmLn++8SJbn/lU8/3FTYgpvMd1cRbPxOu7j8FDU=;
        fh=9SwSdYihNkHpH0KdkscdlYN/2dF/LDmqdw9O9131u4Y=;
        b=c/st/FjKCoSreqkrAIT962WSdn5yNSKZOfwGZ3+tsTYRa6sT2L3HVxPpdEU5qeMPy/
         akQnfJG2NMZBQZbfrWy1p0QRrjlwRYa0jD0XwNr63V+Doob2gsFPUz46LHvJGlEbm4Ca
         iQT2FhtGEhdSusHrRWnF7SQaCsMsB5y7YWfFV/kyEj8MhCBN0IGXiqrWz0NOthhYFEPS
         X8gaklu+AnK1Y9Z671KgQMbyiVMeaQ6qbRFXr0O12ic2yfJqTTyigNYU4aZIUO4uM7wb
         GV3sxlNNm99KRKWFCEdREA71YqYqlpSkpiH3QkTyaKHUUypax/kxZU9Rr6xINJlDWRw5
         P1Iw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790175410; x=1790780210; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=80Q/UmLn++8SJbn/lU8/3FTYgpvMd1cRbPxOu7j8FDU=;
        b=oyHvfVm07uVv6wAvcM3rC8TuEXaCrxYgYS59IpqZOpwyRDUa0tp5JK50mzUuSpiEzV
         X+mTdKH8nKMvYvJHPGJtpiYbKpTcCMu7YMpHkPrNACNC9RF9UQgLmXoHbOqsKd9BQlK6
         7/AyW9GSIAawe1FaNfSkuXMpb3JV9TbaEW06aCABr/BetDCcBg5x3xndQ01BQmD8u/W1
         BHc8jRtJE8XStDIZ4sMj8U9ra3+njoOeDxx9XGhxJendEyP4Rd5SfdaDDmwOTawwNUmY
         7pIeH7Shq1tZYDAeBSmiJTTlkaFEDCAipuaST3/TpYT2cPl8UkzBkfvodNZRtnqGpcAZ
         APZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175410; x=1790780210;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=80Q/UmLn++8SJbn/lU8/3FTYgpvMd1cRbPxOu7j8FDU=;
        b=ho/Zg6Wfi5Sv6yZtAaumT3Z8q5MlOH2sv/IJs4FXEj/tirfGO9SCtvIff7rRdwhUEC
         YsVLYmieAfHfsYwGxcu+pVjSo53C1YZHARhMzOmgWSfekf8jJ3uzpvF43HVhDmgPTOT5
         Xztyd8ErSR96bM8Sf88zkRQ4atNDqHPL6Vsa/h8cuVkRguf8bbKUaGLSlws46AdCYgW9
         rhggesxv119Lx9MG4UNHzfhY1UL9fysdnsGcrLsnpseM4YOfX+8fS/zzFXSn0FZcZpfr
         yw9Eihuz/7vZrK/8HjWUhjXzVtaIqmTqfJJKhvQ2joRfFtBqHOsTQpLhGodAZ5QDxpVo
         +LQg==
X-Forwarded-Encrypted: i=1; AKwUvBzT+0ydPuD6nyoAGQD/D07BhxWqAYP0cA7hoKh2qq79ZqU4GfavwkAP6DH9P7gPee3SUNw=@lists.linux.dev
X-Gm-Message-State: AFuF++ntotdeyy1oKMnktpGtOElW5KOy3Ddch9P+EHzd6DbN/gQPcUNQ
	U1AI99KATWwvxw41x9F3Uql3RgbO8ANUmna6NGYaBWDColPslgEMC/v+2M5hKcZLgx20lsTgcfn
	Yr9/JrXzvYBlh5cCdknNUSG3/gejzZ9nZW/FLdNcXCg==
X-Gm-Gg: AYBFou2YL6o23JTw3HAqNxBxB+kn/06QNvsC+xkhqGEvrC/PAQNA6Qw7XmCgdJMOQhA
	XIZzjTZ5SLEtomXm4nsEW1xruDyolK92lEmvwaB1O/yLOhyshFctye9Fku7y7SrAw8gSUsFBxtD
	lsWyW0rAuETLcr9QTpeIOwcEfQsJb4SRPbGTp55xski6I+0kfWV+4ad+eIQYNFa3PGxHY0ya/3d
	ogfn4mrDRJn0Tr1n4ftGZ9qGSR6aG8O5DqqPfduAvCKionrKBlsczPQH4OUx/t6cvPBBJcuARy6
	YdcSqxZnJE7KsOJznYynk4od5c+JEHDOeSzuWzn+D/y1W8uUOie/av9pnLd55uJn6Ma4IaBhCyu
	2sBKQuGRo8jw=
X-Received: by 2002:a05:6402:5514:b0:6aa:129a:1f70 with SMTP id
 4fb4d7f45d1cf-6aab3b647e8mr2420276a12.43.1790175409790; Wed, 23 Sep 2026
 07:56:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
 <20260916-remoteproc_virtio_map-v1-8-dac8c5eb4aa9@valla.it>
 <arKhbxi3Snbt1_Mn@p14s> <arLZj2DxBazf3wMd@bywater>
In-Reply-To: <arLZj2DxBazf3wMd@bywater>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Wed, 23 Sep 2026 08:56:38 -0600
X-Gm-Features: AclHuK883D6T5DYJIUEwz22c4TjWkQLK7CcGTqdjz7jqNMirfKCdfrjOT14z4v4
Message-ID: <CANLsYkzC5DU8j_QJLkuUcV2tYb=G86L_G4yiBZTePKSqiRdd6w@mail.gmail.com>
Subject: Re: [PATCH RFC 08/12] dt-bindings: remoteproc: add remoteproc-virtio
To: Francesco Valla <francesco@valla.it>
Cc: Bjorn Andersson <andersson@kernel.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
	imx@lists.linux.dev, iommu@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 13:44, Francesco Valla <francesco@valla.it> wrote:
>
> On Tue, Sep 22, 2026 at 09:40:31AM -0600, Mathieu Poirier wrote:
> > On Wed, Sep 16, 2026 at 11:10:53PM +0200, Francesco Valla wrote:
> > > Add a new binding to describe remoteproc-provided virtio devices; while
> > > these are discovered through a resource table parsed by the remoteproc
> > > infrastructure at runtime, their description can be needed to probe
> > > non-discoverable buses (such as I2C) or to link consumers and suppliers.
> > >
> > > Each vdev is described by a dedicated "group" node, which then includes
> > > a virtio-device node, which binding is already existent and used by
> > > virtio-mmio. Each vdev shall be stattically linked to a "group" node
> > > using its index inside the resource table as the reg property of the
> > > node; this permits to have multiple instances of the same type of
> > > device.
> > >
> > > The binding is intended to be generic and adopted by any remoteproc
> > > provider.
> > >
> > > Signed-off-by: Francesco Valla <francesco@valla.it>
> > > ---
> > >  .../bindings/remoteproc/remoteproc-virtio.yaml     | 89 ++++++++++++++++++++++
> > >  1 file changed, 89 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > new file mode 100644
> > > index 000000000000..c4a0d84b1460
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-virtio.yaml
> > > @@ -0,0 +1,89 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/remoteproc/remoteproc-virtio.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Virtio devices over remoteproc
> > > +
> > > +description: |
> > > +  Virtio devices ("vdevs") can be exposed using the remoteproc infrastructure
> > > +  and its resource table. For some of them, a device tree node might be needed
> > > +  to describe remote undiscoverable hardware and/or connect consumers and
> > > +  providers.
> > > +
> > > +maintainers:
> > > +  - Francesco Valla <francesco@valla.it>
> > > +
> > > +properties:
> > > +  virtio:
> > > +    description: Contains a group of Virtio devices exposed by the remoteproc.
> > > +
> > > +    properties:
> > > +      '#address-cells':
> > > +        const: 1
> > > +
> > > +      '#size-cells':
> > > +        const: 0
> > > +
> > > +    patternProperties:
> > > +      "^vdev@[0-9a-f]+$":
> > > +        type: object
> > > +
> > > +        properties:
> > > +          reg:
> > > +            description: Virtio device index inside the resource table.
> > > +            maxItems: 1
> > > +
> > > +        additionalProperties:
> > > +          type: object
> > > +          $ref: /schemas/virtio/virtio-device.yaml
> > > +          maxItems: 1
> > > +
> > > +        required:
> > > +          - reg
> > > +
> > > +    additionalProperties: false
> > > +
> > > +    required:
> > > +      - '#address-cells'
> > > +      - '#size-cells'
> > > +
> > > +additionalProperties: true
> > > +
> > > +examples:
> > > +  - |
> > > +    remoteproc-cm33 {
> > > +      virtio {
> > > +          #address-cells = <1>;
> > > +          #size-cells = <0>;
> > > +
> > > +          vdev@0 {
> > > +              reg = <0>;
> > > +
> >
> > Do we need the 'reg' since we already have vdev@X?  I'll let the DT people
> > provide their input on this.
> >
>
> AFAIK yes, because the rproc_get_vdev_fwnode() helpers search for indexed
> child nodes using the 'reg' property, not the node name. This I believe
> is the preferred way of doing things.
>
> > > +              gpio {
> > > +                  compatible = "virtio,device29";
> > > +
> > > +                  gpio-controller;
> > > +                  #gpio-cells = <2>;
> > > +              };
> > > +          };
> > > +
> > > +          vdev@1 {
> > > +              reg = <1>;
> > > +
> > > +              i2c {
> > > +                  compatible = "virtio,device22";
> > > +
> > > +                  #address-cells = <1>;
> > > +                  #size-cells = <0>;
> > > +
> > > +                  eeprom@50 {
> > > +                      compatible = "atmel,24c1025";
> > > +                      reg = <0x50>;
> > > +                  };
> >
> > The previous patch introduced bindings for virtio SPI while the above two are
> > for GPIO and I2c, which is very confusing.  I suggest you pick one and apply
> > everywhere.
> >
>
> This is because both GPIO and I2C bindings are already defined - even if
> not used in the devicetree files part of the kernel tree.
>
> Moving forward, I plan to submit at least the spi-virtio bindings as a
> separate patch set, as they can be used independently of this one.

I suggest you leave spi-virtio out of this patchset.  That way we can
concentrate on doing only one thing.

>
> > > +              };
> > > +          };
> > > +      };
> > > +    };
> > > +...
> > >
> > > --
> > > 2.55.0
> > >
>
> Regards,
> Francesco
>
