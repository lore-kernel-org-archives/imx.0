Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8755C4ED1A9
	for <imx@lists.linux.dev>; Wed, 14 Oct 2026 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973038; cv=pass; b=Gtcbc14gB4bWkkGcnpblGXMymRy6l+TMGcUWAPHnp/P9GSLkjWEO4wxrkEfdUHOEknZygxsqLmuP/TNAxORl/7TDkfoPcZlCVccAnVKkPydCQnDBdmwZOcLaKbJKf65q0SJJzRT/r7WvnkquzXtEN1WfJexrPT9IVw2hgJUhNv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973038; c=relaxed/simple;
	bh=LTP7G2+FpL1LCEYiFsbQFD9nCHZqmwYYze7/kvg9fxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ci4hiGRpDsfhoXOjqwkDmytd5okuWCVPb5PLQ9i6+cXNfpO/zjaRIkLlCHICqdzSAUsZ0bFMfdETnEi3nW41Ae/P3j1DOvORD/Q+N+vEucZ/h7CoWCwbgDzEjjrhmrhFLFXQRdREr4UPs8x0maHfy6fAXYBUuJ9cAJ5NI0eb15k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d6zgHieF; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d6zgHieF"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-67699afea08so3055737d50.3
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 03:17:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791973024; cv=none;
        d=google.com; s=arc-20260327;
        b=iieCT+2lB4//U9sbcENDMunIwnlzi6L1X+QUc5dqJtFF/Y58PNYpTZfpwMsp8KyVlp
         CaEPPkI3swIP1zSuw8F1kBav1XktmHul8Q/U5+tks3asitZXBBPm3DVAOD2mYAhKdAim
         IbkT/M4e5pyZu3Xs/HsxAX6fJ73M1nKmOsimi2biq3HKJczNfcaEFXLPHsEbmAxBPUQZ
         P5io+IIfzHtyaKJ7VVTEVKaCDgGI63ZC8S1+GulNJuw3WKjafarz5Zd4WDrjEQxUZL/l
         0Uk1Vxmc+Hl5VN5il8yyNyRjDf1Zxv8lMSQM+A0lkrTMbgIM/YSg4TnU6zcDtaxjML6J
         veVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zNSNJNbOjn0ZweiURlFy5cYJ2JPfFsmhS88eDUK8lCI=;
        fh=XTRxS0rmxZDrwIbJItfsTOIhTJaJqmiME7VrHny8Ukk=;
        b=d8Oe7iKpuS9Qn829kBL2CvbY6PCL/uXB/oF1O49d80Wm6gPI4bmbvIhkoqmKMKVKfH
         IIp4sk+1M8diHA9LOeSegW9Nax2SRNf0W9VnM/4Ru7Cjm6qAAi5eqkx4d594aS0/jXR/
         HgLWLJlxTWvOmw1Gcd9FwMMMzcUto3RhTHsxvsA2s0+zbajqiBi+bJay/6DhwUcIK9Sc
         hWMjkDFMsNjN2lR8LBdMhI95Xtt0BP1D16bpYEYYE2xdqdovIviDeOPw6g4b+8W5uASy
         ooREkQFxdWO/wcY+lz2h/dteShjpMo+MCkHxFB3ndAanrZl4iWeZ+30VRfQ+qDtPJTnY
         mC0Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791973024; x=1792577824; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zNSNJNbOjn0ZweiURlFy5cYJ2JPfFsmhS88eDUK8lCI=;
        b=d6zgHieFPBg7PzhPFJKodrJOgMXtVLiShUFl3jDlArCXpHMvzzzk7InAEMglzL/vxG
         v6rbGmVzuNv47tBFNT3CscP+rNUniFyH8YEHqu9Zwla2P3Kl9InlQD0JQ6SBEIK/J6SD
         IGW0lNqMh3HFYEIi8SZHMgHrUuZvw7f0+u7/I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791973024; x=1792577824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zNSNJNbOjn0ZweiURlFy5cYJ2JPfFsmhS88eDUK8lCI=;
        b=QrohS3Rk2LUTxfgYusbFfQHNMH+oMHV78k7u9U5oV2/DeYajjpmwDTPz2ifvprlXpW
         d9Cv6NHhXyMEzzp5nYScmPixCDqGkELNWd4wxtgKxJRTyNutaCP8XKizb8x99gnZt5Fb
         N9+a+1uWyo7emw+Wf2Ev3lH/4uGeEgrTApxNct69ivFdE907QFcTctu3dfgd/37fbU/m
         TlHXj4cXjaDpD8TwJgs0MLgoTeaLI0/95YQM7A9VMKe4O41F/LTqul5bNLkuLPfWUQHa
         FR/bNZA+/myQhdM+msUtsGrhKYN0fHO1bXVQyhN9EzzWELVgGOpigNwafPAvw5JEDup9
         eJ4w==
X-Forwarded-Encrypted: i=1; AKwUvBwxbDwXLY/UxzqDPr5v3RSCWAt7ciMYdeqYjyoal2q1GvguVw0UI1VnCwS6tEZHXcim9UI=@lists.linux.dev
X-Gm-Message-State: AFq9FYJYOQdsLBeY/TQD8wHiphrLqzrsoH5ANNhIzhyYWWepoyCgExH5
	pv0QL42wC/NGECIWbLH62t7sh4Kcv0oKY0tCOboB5sVShddfteBMt36oer2qkqu0kVy8NoIphyU
	UHSgbM6mo1P6hxIIN87/+No3wruecjsgzl6Do9UXr
X-Gm-Gg: AYBFou23/yBi43csv23Fo9c/mDSDwDeBCKUNSs3ogfbxVAJ5HvXGKgtS9PtRTC1MlRf
	dvojAJ4SzgifmW+ZrFiadVsaKQrOr331PE78B/Y+H+XEh50R5lFUWkKCf6eI7XNkJ5ZQlNnC3/C
	jgKDjBOJHSr9nW0X0z07TWbTUvWbLfAaAYXpe5yad2Dcf1urlXOSNm2o69cY/Ud2CuaoehW8RXA
	Z1ct7ddho1mUwOD5WYIuJlys5so6K9vdrfEPAdCyFQ7nYmZdMVINdh4gHGthMwrk/dEGrLN6/xN
	Ea5I6p2q0qwMhHlIEW0bU1DVibcjiFcPDotpt/q8EPtdfuoL533Ux5bf
X-Received: by 2002:a05:690e:b49:b0:679:8dd7:1d19 with SMTP id
 956f58d0204a3-6798dd71ef4mr307524d50.74.1791973024101; Wed, 14 Oct 2026
 03:17:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-2-wenst@chromium.org>
 <sashiko-outbox-171010@kernel.org>
In-Reply-To: <sashiko-outbox-171010@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 14 Oct 2026 19:16:51 +0900
X-Gm-Features: AclHuK8vB58kVrwUvnG_FV1Bk2KZp5BcyBdkPIRhgzNfIxk2PQPvWDXOfCqkhAM
Message-ID: <CAGXv+5EuYc3iEpwNDNX+Sa2QXnPNe_C0HHH1PCy+j2vyV88xuA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: usb: hcd: Add downstream USB ports
To: sashiko-reviews@lists.linux.dev
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, robh@kernel.org, 
	conor+dt@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 5:31=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] dt-bindings: usb: port@0 schema constraint bypassed
> --
>
> commit aaa6107663f4d524c266c3a18264c416a86a4bb4
> Author: Chen-Yu Tsai <wenst@chromium.org>
>
> dt-bindings: usb: hcd: Add downstream USB ports
>
> This commit adds a "ports" child node to the USB HCD binding to support
> connecting downstream USB connector nodes via OF graph. It attempts to en=
force
> that USB downstream port numbers start at 1, and updates the address matc=
hing
> for hard-wired downstream devices.
>
> > diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Docum=
entation/devicetree/bindings/usb/usb-hcd.yaml
> > index 45a19d4928afa..24df99dfb243c 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
> > @@ -29,8 +29,16 @@ properties:
> >    "#size-cells":
> >      const: 0
> >
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    description: The downstream facing USB ports
> > +
> > +    patternProperties:
> > +      "^port@[1-9a-f][0-9a-f]?$":
> > +        $ref: /schemas/graph.yaml#/properties/port
>
> [Severity: Medium]
> Does this local constraint actually prevent port@0 from passing validatio=
n?
>
> Since JSON schema patternProperties only restrict matching nodes, a
> non-matching node like port@0 will fall back to the generic graph.yaml
> reference.
>
> Because graph.yaml evaluates anything matching ^port(@.*)?$, wouldn't
> port@0 be evaluated as valid and silently pass, completely bypassing the
> intent that downstream port numbers start at 1?

I suspect I need to write it as:

    ports:
      properties:
        port@0: false
      patternProperties:
        "^port@[1-9a-f][0-9a-f]?$": ...
