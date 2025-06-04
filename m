Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFD82F56
	for <imx@lists.linux.dev>; Wed,  4 Jun 2025 15:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050474; cv=none; b=L3iMPDX2eI4SoPU2ga6wE5haPwRqshi7Fy84gnggpsM7/k46AwnKELQLQYbKxpSB0+Jstq4O9bAv6nfAMOqUxIn/7siQbdmhiNnaIDukLfFEMIUU1R4pfa/cvtTs/gRLa2gLDPw+7ADI9T7dkqTZyr/C2lbQsyTy+RVUpg1hi7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050474; c=relaxed/simple;
	bh=owjnO9VvFJBs4z0MLcAItFN+hb71KXnPMbLj2c7IwHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K9gDpiYAHnTa2IduRWgTbVfRvZ3QLirl5F6fg7v9KmV8zNaN1NtkooyB1ehddGDwcWH6zyKKPtDpIWRd7v729SthEESo/LefR6p4NGvLpOUK0QURmfZ0yDWuS5b6hSHN4Yh9ULvKERjMwDv/vbijQ61hC3FxSF3ViEJVg3CWTPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nrbwvnH1; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nrbwvnH1"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e803de44766so5038291276.3
        for <imx@lists.linux.dev>; Wed, 04 Jun 2025 08:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749050472; x=1749655272; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wC7mKSrr4kiaf3UIcJvhXmaBddWPavsd+lLtVOh+oBA=;
        b=nrbwvnH1VboEz/UgOsXZr2J7B7WqTWSMHIHeCOv/KLQmX4nAXR/uPF9lycwDz8OPAp
         letJYgKKMt40pT9mcx2Ekaml39yBFPfsR6zv1vz/lMd2RwI4QCULaVATextCKm4MHekd
         1wk4Vz2mlXh3pj2TBEDOBGH85uRTMWZuKE4m6qP8ZK/B0UWRBuLzldxnTT4grQdX6zdr
         EyKYqJJLLISGHheAwtkUs2ZwebbEkiCVphXesX74DsGlV4/dRsnmaeyIOYxLi4GZVrYz
         zgawb3iFn+6cV285nRUKkk1xfAXwJIduEeqMbqBSf0HRigtvXR9x/InmvSKEBaTCFDIZ
         wdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050472; x=1749655272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wC7mKSrr4kiaf3UIcJvhXmaBddWPavsd+lLtVOh+oBA=;
        b=mbvRg6hL+exBaxSwfrNlI7yGraZDaaPZX0hPO/WcJxOJPTiV4tnEXl4Rt+cKlfpTnT
         zNSsK/38JXmf6hctONg66LR5/lSeS++sj/NSfE3Al4rnQtSh9CVNYvPoCPQ1XrVaOHsU
         S6MfCkrIrhwUwR7TtY8R8iH0Y/dPwIOMEPGGfbXzQdFiwjdmIfBMmzMLBuuooYHOeWxh
         PpWInytzTVOiZUNK19eR2zusC5q/A56gIcdJxBc0AlTAbsTnAFBNkqSmmG5KNylU5vO8
         qr7e7mvuyFL1xQ17Q99Pgojj8hU5mGDZ3uc4x4ziClcxISdt5OXEEXsO56bOjPCF1OJ3
         n+/w==
X-Forwarded-Encrypted: i=1; AJvYcCXiNC8dSPWze4zg8shshExpqg7O0lk3rciVYO++TlUwMi1Vxx7BfxMcCyi9wWUDCrWOwfI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgLvD9LM8o5KQu4S889FULVlJPsT0LVcIPirV3jUzk8VvmN+N9
	utDtSvOL77hlc20ujK+rXD0n1sF+ofVtf+LupMzrmpp9o495yJ/rQyIceMqtIq/GdF+D5kk0xX0
	a4uCYfEENj/XHPq91ZpfF0hWkR9ZWusY=
X-Gm-Gg: ASbGncsvfLP5KlZ2K2mVvIQNekalRhf/lz4XHPeDaHbWJ1zpy0bswnOuNnl5uNSQVeh
	3Ax6NVgO0mAhc8kizuVpo957Mmoj9GvTrWlxwLX19+BmLjTMdrAFFCw0HgLIieJIt3JOY7NjXfd
	J9WxXd5vC5oGH054X70LHK3jzmugcHlMM=
X-Google-Smtp-Source: AGHT+IGREyE12fbHjJBCwDCkpDdLrlnY34Qx31wboQATvSL9xppWlFT+MzuRD7abZcfpqgHcsVZXAPbDl5OG9kjk1cs=
X-Received: by 2002:a05:6902:2102:b0:e7d:6d7c:c33e with SMTP id
 3f1490d57ef6-e8179da11c7mr3933634276.44.1749050472139; Wed, 04 Jun 2025
 08:21:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250603221416.74523-1-stefano.radaelli21@gmail.com>
 <54c4a279-a528-4657-8319-c9374add54b7@lunn.ch> <CAK+owoihxp-2xAvFfVthvNELshti_3V-pFgD7D7jzd1XqiLgGQ@mail.gmail.com>
 <d5f891d7-d24a-4f85-b59d-313b925c4495@lunn.ch> <CAK+owog69JktbsBhHZj7ULYXmH_bZ-CO8=QEMqBVc0mjp8jz6g@mail.gmail.com>
 <1d755cbf-4dee-4784-98b7-e72061219e3f@lunn.ch>
In-Reply-To: <1d755cbf-4dee-4784-98b7-e72061219e3f@lunn.ch>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Wed, 4 Jun 2025 17:20:56 +0200
X-Gm-Features: AX0GCFssVbXWXo-ClT4FiYIScIddnBW-kBko0Lugw34l6NVIDWlAS9mHkPVmzfg
Message-ID: <CAK+owog-Mipq2Oc0=gd8+LziHmVUrC5R7HidYYZWu9_AWu02TA@mail.gmail.com>
Subject: Re: [v1] arm64: dts: freescale: imx93-var-som: update eqos support
 for MaxLinear PHY
To: Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

Absolutely, thanks again for pointing this out! I'm actually glad you asked,
because it pushed me to double-check internally with our hardware team
and confirm the exact implementation details.

I'll make sure to include a proper comment in the device tree right above the
'phy-mode = "rgmii";' line in v2, clearly stating that the RGMII delays are
handled via fixed passive components on the SOM's PCB itself, with no
software or strap-based configuration involved.

Thanks again,
Stefano

Il giorno mer 4 giu 2025 alle ore 17:13 Andrew Lunn <andrew@lunn.ch> ha scritto:
>
> On Wed, Jun 04, 2025 at 03:08:09PM +0200, Stefano Radaelli wrote:
> > Hi Andrew,
> >
> > To clarify more precisely: hw team told me that the required 2 ns
> > RGMII delays are
> > implemented directly in hardware inside the SOM itself, through passive delay
> > elements (filters) placed on the RX and TX lines. There is no reliance on PHY
> > strap settings or any kind of delay configuration via registers.
> >
> > This means:
> > - The delays are fixed and cannot be changed via software.
> > - From the point of view of any carrier board, the interface is
> > already timing-compliant.
>
> Great. Please add a comment in the DT explaining this. 99% of the time
> 'rgmii' is wrong, but this is the 1%. We should make it clear this is
> not just another cut/paste error, but very intentional and correct
> because of the PCB design.
>
> There is a patch to checkpatch.pl i want to introduce in the next
> development cycle which will look for 'rgmii', and if found, look on
> the line before for a comment including the word 'PCB'. If it finds
> 'rgmii' without such a comment it will issue a warning. So it would be
> nice to avoid that in your correct case.
>
>      Andrew
