Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687233;
	b=HrupL6mTbGzolL8KdsdJ5Nd+NzYg4G1xtskl0o5J3PO93ueZgLW0gF6Tcpkx5YPkrSYT
	 Pqvh4f74QO8Gy9p49fyqfVUTGENZ4AixyiemEsR5FzzkvvkgowEbbI2Sq9lOmfHPfs+sj
	 G9vkFxiH4wfnvFoeR/kaDEkrllAHEQbhU33bdZBFzIDD15ndASJXKpxW94q/oW3rlSigo
	 ybs4tTCL4eyvwhqF8dOUcr0Ve31DnsSwoFvke1HphMRvtrLO54zoN4MamrGZcRwAwiY9p
	 5nvksTh7oTrEzgxkvQiiD4GZzdEoxi+dL/NEC3rqcpyEMFxSaaey4OfKhPN7b3+jErw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KIXR/3+QUTDcEupkbOOsq++gF5QeeU/bfAuAJ1TSZ9Y=;
	b=GYvEqmvjTFQs/hnTCoSsfIwfXgq7KLyZGxMgJxl9rTHrXgQMDxK9k5gx0MCxdPklUryK
	 u/FCLg9y7mae7JdUKyjNzKa9cstF0dSTK3kmvr6Ir2E5tabzQdRMLs//ejXrmcETTw4hD
	 vp3VEmk1OHwwUjOFZN0d+9D41/fWLFGtz9EoJY3eSCC1UuVOGdb3br8kHrV7GGC5wpfpi
	 diaOIgMfb7/XKncU5fuH4xhvJNfv8I8Wg3U/hcm949rMV3IIArrbbPpQlIkNhCjk9HmHf
	 ILXZN2DogZZC8pDWC7W3gWTfJMG5ik2l0FNriADwbvpBrpbEA9PDA/0WEW6D1zkukWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=RHnQXCX7;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A95606A31F
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 16:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9A95606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=RHnQXCX7
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c247f6687dcso308447166b.2
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 09:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792687231; x=1793292031; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KIXR/3+QUTDcEupkbOOsq++gF5QeeU/bfAuAJ1TSZ9Y=;
        b=RHnQXCX7TDq0SqzEg/X4WVKXGhZ41ZKyxWPRjuRnacl/BO8NNGTOBQrevI1UQfhBmb
         DPJiDIrlNMQN8uNBVtMtyvkqDZWeEvSTUpE+m/8qiRKPqGXjJIqricaoTIUddC66xm24
         6WLOurJMSOlrCCBATt/fWvZaJow0raXmlMNCY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687231; x=1793292031;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIXR/3+QUTDcEupkbOOsq++gF5QeeU/bfAuAJ1TSZ9Y=;
        b=LGH1AzTkqaGwillBIehnPPBSmclC8zzqKexO/aTJV1ACCXEX5WW4S3ElYRHzYRdng8
         cyQdhfllh032nsEfPIfracCzjg8tl8WamahxBl72oBPwcRhsi6uRC/0CDguRM9ex17Xa
         aC+1IZXGql7Fv28Zux3KxI3Zt8lYYa8bQvUboMS/aI6jDGcvDkp7o5inD9J+bw+wLchZ
         16VfLMyW6fLbVM4fSYIBmbTwRJa2Fs1D63BVZibXIehrLbqW1OPZIl2DAfCNm2RbSnJ9
         VmSeGbbJaWkV7gnMI9WrO3/3EU6WvKYr7SiKhOKXNlpKPbJi36Bwb+W3u9XCteuFr5yt
         wt/g==
X-Forwarded-Encrypted: i=1; AKwUvBxvt/rrEbJ6uSHlx15HoWX0/fuuZDBj2ZJnPCBCYEK5hATm8+70NLY+x++wqeIkANk2jFA=@lists.linux.dev
X-Gm-Message-State: AFq9FYK6xgppaT7oMVM20QZLHHRFA+w2o9IA+2V1Pc1unRIEop7M8gYM
	bYPx09KvpASFYcycaxKKp/ttClkD2OrbcodvvuLcWuiZdLsXwjdCGvKBP0C+5DeqeIs=
X-Gm-Gg: AYBFou2SW2mdZGNefSrVVr8fhiqUPrFMIWb2v78Bdp6v3vmOeipm7e3rr2M+VEQz3xw
	oXKEIJVw0xMGyqKc43Pqz0RnjiL1rMe7GVYBKwnNGwa9o3ktbX5u6lamQyJOuyPx7ndaaMmeR6X
	hptWkpZsESvzY2F8jACt4DkTMoWEQZL63uuLIGiIWUN9bqXqZ7dnpXOHR+gwWZLnkp91offkEa/
	vmV0yYCDqBjPffg5HAUqmBD8Qecjl8OYxp8KtnS+a5bg049CuJqQG0bJ2F+7BA5THdA32Qq3qeb
	sL0EKS5qt1zr0ri4SCeA9ecfWy1r/ua8cxUEfeBgwoafjXesyLDMrGPTxpl22tA2wwgUOZzD2OJ
	1F7HBuKr9rNt0c10ivavTkKwhMoT582FXTTvXa8WTXELdH16xFQgw9H+I7rPu/n3FL90pvNKrBV
	P+PIbseM56KTyIR5kk+7FusfjbvryWkMBufKyY3WbicuzlU1eW7d2eDrynBtG89n8zAz1c75fyy
	zyO5+5eSAdwK40+QhbF1lfxol1DZyGAKv6mNs1j7gSod4RzxMuKy1STwXMg
X-Received: by 2002:a17:906:9f90:b0:c2d:be57:f73a with SMTP id a640c23a62f3a-c4679536f80mr679402366b.13.1792687230949;
        Thu, 22 Oct 2026 09:40:30 -0700 (PDT)
Received: from carbon.k.g ([95.43.162.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cfb941sm5456866b.82.2026.10.22.09.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:40:30 -0700 (PDT)
Date: Thu, 22 Oct 2026 19:40:28 +0300
From: Petko Manolov <petko.manolov@konsulko.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu
 board
Message-ID: <20261022164028.GC3711@carbon.k.g>
References: <20261022140244.3476844-1-petko.manolov@konsulko.com>
 <20261022140244.3476844-2-petko.manolov@konsulko.com>
 <sashiko-outbox-181612@kernel.org>
 <aton_teIric7IKX8@SMW015318>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aton_teIric7IKX8@SMW015318>

On 26-10-22 10:13:02, Frank Li wrote:
> On Thu, Oct 22, 2026 at 02:10:36PM +0000, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Low] dt-bindings: arm: fsl: undocumented draeger vendor prefix in fsl.yaml
> > --
> >
> > commit 3465979b7c116a128c865587fd61bc41cff5927b
> > Author: Petko Manolov <petko.manolov@konsulko.com>
> >
> > dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
> >
> > This commit adds the draeger,imx6q-m48 and draeger,imx6dl-m48 board
> > compatible strings to Documentation/devicetree/bindings/arm/fsl.yaml.
> >
> > > diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > index 656f2596e1d53..8f3a04228780a 100644
> > > --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> > > @@ -260,6 +260,7 @@ properties:
> > >                - boundary,imx6q-nitrogen6x
> > >                - compulab,cm-fx6           # CompuLab CM-FX6
> > >                - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
> > > +              - draeger,imx6q-m48         # Draeger imx6q variant of M48
> > >                - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
> > >                - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
> > >                - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
> > > @@ -458,6 +459,7 @@ properties:
> > >                - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
> > >                - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
> > >                - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
> > > +              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
> > >                - eckelmann,imx6dl-ci4x10
> > >                - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
> > >                - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
> >
> > [Severity: Low]
> > Both hunks in properties:compatible of
> > Documentation/devicetree/bindings/arm/fsl.yaml introduce compatible strings
> > with the draeger vendor prefix (draeger,imx6q-m48 and draeger,imx6dl-m48),
> > and the follow-up commit 6e00402d882f ("arm: dts: nxp: imx: Add devicetree
> > files for M48") uses them as well.
> >
> > However, patternProperties in
> > Documentation/devicetree/bindings/vendor-prefixes.yaml does not appear to
> > have a matching "^draeger,.*" entry:
> 
> Please add a draeger entry in vendor-prefixes.yaml.

It is already in linux-next.


cheers,
Petko
