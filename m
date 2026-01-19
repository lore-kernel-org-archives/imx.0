Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6386926B2D7
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 06:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804058; cv=pass; b=Bo/GKV1yM4mFQSH2SPyyqkNpUgvLB6OSZ6tIT64HvX42yCru23/FCTHQ2VI9cebNzB8qNHrx4BnlTY7BreW+DAXIhHz9Ew5jJECtED6HsVyRFe2SELcxHDXiies1rCj2l7rsxW6pyQ8Eqj+/3yv4CzSDaJrYlH/nM+o3O4PVBhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804058; c=relaxed/simple;
	bh=oieor7VL7XmLcFuWp2WFAIYBHFITLArY/5uQmoKHexk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PIsdrxxq2wHEJaKHZZUIrMA65pM/2eZl7OMkFfC8NFm3BP8OdRHn1nvjueuDnW3sk/1MPksPbYwt8Cz9j61/CaQB/5yVakAGmliLBoeRxm0eCjiqI0fFamx21oBLuZAw7mOQ1ty8TXNpLceSt4IyZNobtWeCSXDXqh9pfMZEydA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLw/61Dd; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLw/61Dd"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c2a9a9b43b1so2712284a12.2
        for <imx@lists.linux.dev>; Sun, 18 Jan 2026 22:27:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768804056; cv=none;
        d=google.com; s=arc-20240605;
        b=NNxdgzxRNSXjawHgXA+TMNaTk4IE1cZHmGqufWs0k1zndg/H6tN4e653XgWKpyj2c2
         HCDRG8dDshah+qu0kn9mNmNSfhiUMCJRHPId6JA3TnqCrRlcNcQvhgqbhJ74L0e/P+s8
         c4nuZ9KcoSge/TVa8YuXndhLmeSgOtNGtVso37cXY87rF8LqvXd4uoo88X0i+oIogsdN
         Wo/+1c+WWeStNPSySH376wMlRXX+FXNwakxpUR3hz9XkPFTqBhom04G3Rv3iEMaD8ol7
         wJgqUClQrtV+nXSmg3p9MqoJTXZc75foklt8em7v6Tbg14TLrme8xllXjs/eVjs65Fpd
         LgQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kcxGM/H9ZkFQ5SWC+rNZTfsrD0aCTEHeA1hsk+XXsT8=;
        fh=lmLqVhsNicLkEQt/LS0Ni6TBuhn/FacRlLrhj5CXseo=;
        b=ROPd0XWPja3dRA+N7lStFcoiEpH8liv5ZxrNPE54a1OUuqA7Fzgs8f9ITvn3o807Uh
         r+jRbLAcwHtMXEykDVCYYCqyj6zdVi616nOoRab7QLsFFTSdyR03GGWhj/7dhn7N1agx
         p6OdblIY1r30KXa+OK7+BjPDnW2juJ34J5119f4SaWLiYpNIbpNoD+XQCEdwuR2iNYkZ
         IWfcN0lWwaCHakoiO4Jj/p0IeB+CjEyIbAMXqSo71B7JDDWJrkdfq9WMViEsZQFsJXXc
         MfCLaG1Szcjaa1+cJv23vEXzJAcjozzYEjtGrwDfyD1oEbmrLkUi/Cd05bXH9D99GxvB
         fePg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768804056; x=1769408856; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcxGM/H9ZkFQ5SWC+rNZTfsrD0aCTEHeA1hsk+XXsT8=;
        b=iLw/61Dd7dh8ZHw74G+KKbTu4xamb6L1ZP9q5XmeGD+qpuOdQaITU/VQSZjTVFcsTO
         c1BLXhtjX6oxZaNQkNkKM7WMqB6fYbR9nWoNZ7eAtEvMuO4dwOPUGKgUUNmAB5eh1Zf9
         aJyWt01Fnxezfu74Y78Oj4T6MoizMY2l4oQqt8FVuIswi/eRWKg78GXXaunVcb2L3Mc9
         fsQgZFtKiC4gf1b/UELdWnejnAEmDws+1uvaMnnaRorZblsEn9ViWo0MM1jPpcdIhlyZ
         QTgnXThIB9YkMzYu2s82Z3vuBipVY+gKo1NolTigeVzrRe0CUkF4/P67FBzJz8QWYUeF
         trkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768804056; x=1769408856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kcxGM/H9ZkFQ5SWC+rNZTfsrD0aCTEHeA1hsk+XXsT8=;
        b=a72M/us6dJKlMHPMEnjtoLHcFM/ZMyResBynjefu7++r6nf0//MAoCsfCV8/+yQO5l
         rERB4U3AMeTzKrKko49S+XsYCSfvLEu/eoffUTPIZmwR4jdt4LkjjQYmMvGhaq728FDH
         c4kQQXOkK06KPUzG/SueZCUgS2aS24sIE2i1PkWd0FDrFZ/k3vxGOrFPr/xclODuaarc
         a0uOxyUq7rJ9MuKe9/bes8WtqPuiirB9VAPn5PvokxSOZoALNDl1pvGsW20+cygZMfcg
         haU3ji46PMHUhbKrt9DUEoT6YShE17Xs3cUHtaJlBI2xOWIfZvUjnWeEws8uQQaU0LV3
         ywsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+j9q/bEuUwGaMa5aF91Wx5xP5yvAKcKnG03xMtt73Be1TWXRKU/Io2VAUgV0E35OSQNw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqduudBxIVRtLMId1UeK9dLiPsmftuYuGcoWyRYTebD9DwPONj
	fxOEqeKZcTMsKeiULXZB39pmAzsNi/kAODr5/hWqktHnCfHeNYiBUUuvLfD4Zj7ZPgxXnCN+pT0
	gvpTxpGOBSf7fgBPzIlANXCaAP89rRhQ=
X-Gm-Gg: AZuq6aLun3buQ97JfRMTIwI5VKh/NM7XTqBsU8RqTGkKiYgdDXB7CAvay/WW4AZtioQ
	p+akkNwyMjpOetOC761D5Jr8b3u26Xn7g/RHWlOM1iKhNYsxdH4J7rsHtBIFO0CavXaghAogxWC
	6wsmAf0hxuoMIf9gE4GUebDAeoTrzyntaTUUUq0JMAE21i+h6J3oTNQS5rbAbyrOdkiXr4hPhi8
	xDy83GLgokNnSiyVo2eBqg7S2+cqWVeIeW5+YSX8MWHOb1a6kaesQR1hywOk/Q96d9YI3KR8Aph
	llvjyQ==
X-Received: by 2002:a17:90b:3b8d:b0:340:b908:9665 with SMTP id
 98e67ed59e1d1-3527329ea06mr8752017a91.37.1768804055769; Sun, 18 Jan 2026
 22:27:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260116101648.377952-1-shengjiu.wang@nxp.com>
 <20260116101648.377952-2-shengjiu.wang@nxp.com> <20260117-versed-proficient-pigeon-bd0b2a@quoll>
In-Reply-To: <20260117-versed-proficient-pigeon-bd0b2a@quoll>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 19 Jan 2026 14:27:24 +0800
X-Gm-Features: AZwV_Qh2xtpI3oElyCcH4AM0eV_DbnEZq9du-jVlcZi7tddPI18dsGW5cus42Lw
Message-ID: <CAA+D8ANrcjvOCfRN7gGGW+7YzvVieU7P2uexUpVYTw6MEHAKYQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl,audmix: Add support for
 i.MX952 platform
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 17, 2026 at 7:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Jan 16, 2026 at 06:16:47PM +0800, Shengjiu Wang wrote:
> > The specific feature for AUDMIX on i.MX952 is that it can be bypassed,
> > so add fsl,amix-bypass property for this feature, besides this there is
> > no power domain defined on i.MX952, so make power-domains to be
> > dedicated to i.MX8QM.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../devicetree/bindings/sound/fsl,audmix.yaml | 35 +++++++++++++++++--
> >  1 file changed, 33 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml b/=
Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> > index 3ad197b3c82c..50fb08460b4f 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,audmix.yaml
> > @@ -34,7 +34,9 @@ description: |
> >
> >  properties:
> >    compatible:
> > -    const: fsl,imx8qm-audmix
> > +    enum:
> > +      - fsl,imx8qm-audmix
> > +      - fsl,imx952-audmix
> >
> >    reg:
> >      maxItems: 1
> > @@ -75,12 +77,41 @@ properties:
> >          unevaluatedProperties: false
> >          description: Output port to SAI RX
> >
> > +  fsl,amix-bypass:
> > +    type: boolean
> > +    description:
> > +      The audmix module is bypassed from hardware.
>
> I don't understand why device AUDMIX would have property saying AUDMIX
> (so itself) can by bypassed. If you bypass the device itself, what do
> you configure here?

The case is that the SAI interface is connected to AUDMIX,  but AUDMIX can =
also
be bypassed by hardware configuration.

Yes, adding this property in the AUDMIX module looks strange.  Another
choice is to
add this property in the SAI binding document.  Is this better?

Best regards
Shengjiu Wang
>
>
> > +
> >  required:
> >    - compatible
> >    - reg
> >    - clocks
> >    - clock-names
> > -  - power-domains
> > +
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx8qm-audmix
> > +    then:
> > +      required:
> > +        - power-domains
> > +      not:
> > +        required:
> > +          - fsl,amix-bypass
>
> fsl,amix-bypass: false
>
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - fsl,imx952-audmix
> > +    then:
> > +      not:
> > +        required:
> > +          - power-domains
>
> Not sure what you want to say here, but disallowing properties is shown
> in example-schema (:false).
>
> Best regards,
> Krzysztof
>
