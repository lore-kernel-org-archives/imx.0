Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.210.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794222118;
	b=TCUKkuMhRNt/Mklmrvv2PPYSliiWPrw9gz2KS5hra0lXUJV010a8KfzFdmHVMcbXIsKh
	 smX1lzMA5vEqUx3nNXinasnTYo7Z2lJB0mrxkbGVY6mVHWC/lEWtVT62z6LFZen5Rp5SZ
	 CBlsraTk8Fs1ajrR/CeNwmggRsOXicKMW6nCHT7rgR5rlC8E08U4+LIS8gRlUn5agRD6A
	 08DuCsLLrGH5BPwJApR1jI+pCCuYbrR5OgS0PWK9MNsPxSldyUYy4xUH3OfEisDZSndxx
	 UHfFbdKbtErqyOuxn0jAbTQUxyDTHjjGFVr+OjvhslThAwqbLWtpk88eUIH6kpt4CGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222118;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=;
	b=0JpPrArAxYC/TninO9f8HR/zYIbermyBz/dnkRaW/EF72fBenKZCnSTokqOieT8lu4Wh
	 4jxT1BksGAQ+jtrdOvszWCdrEu+ouTwGF1i5XoGjXmyEh8Mk9B0bZF5ZJhJtjLiTUpktE
	 +RjOuctCZHkcoUGLX37lCHWVrN7Ney1iHYm2S8wdTDXb7J2+FfpbywyhgFQXsQrXChs6E
	 DxAow5OAChqIbehJMQ03IENKEeyw+ImkbB1bGYjIonYtAKQ7YuaEIvxlgZt0XWiZ5wBkX
	 /b0y4mfqdJCc09UA/P2GlyY7drPKaWjXRT1MXpZfoizQoiZdRdLumgjnf7qiYS9UdUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T5TNawc6;
	arc=fail smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53B2606A322
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 11:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A53B2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T5TNawc6
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so479010b3a.2
        for <imx@lists.linux.dev>; Mon, 09 Nov 2026 03:01:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794222117; cv=none;
        d=google.com; s=arc-20260327;
        b=LHYf0LnBDucWY/2QCoxjrpZTPPNpGTJK4BPDKWeL08m2xc9w5QEwl+aT02FFW8jy+8
         HM+RxLgd8Tw1+eB1L9+rVD6JJ9I+M+10wMYADvvyr1bDN6SpbTmKdFQScRqfl2nLIgPK
         QWf+z3WcScAzXDqXgYFhNVTxxJbCdAANWMfzm7EJI3v2WliivPfIxFP7Seuy9a9cdA4e
         5lveuahL4s28GslMi3Gcvhf8qPJFhQIzlWYjGfXymrFJ/7Jw9nCb93fff+baMUgB1llR
         STLjLRJFAWHO0BlJ9F57IPO/mGL3nZpo1dXXMYAj5LnVzi/bzm9TSpS4096kGg5RWSAN
         TtxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=;
        fh=vYnPsLIpHMhYEM7N8Bd/dyIYh/yft3ZfZPRAy9O1rCk=;
        b=EZpiEQgrHH+aV7yzdl/MEAtYQ6uJrQM1drHxVgHTwwztK4ngrkv9n34VlxUomOIiJu
         u/BKnJPzORETjMFFpHiW9HKSw7B+fwAeouC7qyoTn2Wc6UB2cn3KUl9mjE1oo4+xIJpL
         QmBT73EvPMmk8SFDa5zrIlq3HOmDtDBJva7tqYiY9tr8qzD5FpCsHShuiz2bWqn7tJCb
         2xJs9cfyOZHLLZs3ASwhM4hROKePOaTEEHY5LXAnK5flo2TepP4haBieX3/nzN4wfPH0
         +XOKiXD057Sn3zEgrpg4zmxMBrY63BSA8HTSxGNE630nlvHy2YuuSj1LMbEM29dPI3bF
         XX/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794222117; x=1794826917; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=;
        b=T5TNawc6FWU1FJE/2cydNLDs/OgQJe0lsolEjf0nW+E2sGQeQfta4NkR2zbypxPujV
         n9w70tquDWbQPDWgWZ6bqEcL1z6IKBZ5bgH7Ms2zYA/+KupgAydvzyaYIuLTvRmpq535
         cC3Ux7QGw+o9hGc3OdXNxEDzscOcGDl+6bQE7iP/nLnTgrcY6IHP/HxRYen4oWU9k45+
         BbHqAErFyb6fzrAbQ7wGRNcYIvcWT5JxRfaryoOaShjAAsB5QzojHYfD2ynxHQqHBhsb
         0v+6SZLiah5ijY+2h2MK36DS2Zd53RNt1okXsnGaViQEBSD4zbjXbBLRQfvFmRL0P6Yx
         0NsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222117; x=1794826917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=;
        b=bP0lLI3fXufGH7NVkJSiU764ChGPfw9XXKHlLHrLxtyvZjPa2pv7luN7NEVsq6iAI8
         89I8lIGthzRdLsaP2Pmk695Y4FPG50jRjG9Ij+IOL2zfNaEBevXCIP/uVeCwduIQccUv
         iwYEVf5QmJtmmUE+3bRcY/2994G8+55bfN1L/5dDjeSqTHUGaTM7Lv5leApPB49RIDFa
         A6IMd3oLk0MVyRm3cCD1T0fanjRpBMRdVC3yw/GFWHMLzSl1Rh2+Mqli28h9Vmna1bYt
         inc3cJXTaSTVIKTqJ7NvAy/79JwRkHPVqRwCwbDfG/4BOT4OsHXOeQrpArjyA+Rf1OX/
         aNwg==
X-Forwarded-Encrypted: i=1; AL+hErHgF3t1TCv5+FVml5lW6F0DSWf44H9Eo2ItiXQ4DsLOV5Ihbq9ZmCDuRjWRUkSaTBTXLaY=@lists.linux.dev
X-Gm-Message-State: APuU4Z/AO7oqhXdG+jT+BJkzJRWtEzKRi1wxLFPtDc7Q96wSdH25t4X8
	QCM+2T3661O4Q+P/LRADM4o4Fo8Iu5jiBdQrmKt7iQXVReidspUnmNpXDdMUI7RWKWSG8HWEsIZ
	/VtA50ZLpZgLgDRv4Lst5cl+KrfunNxk=
X-Gm-Gg: AYBFou3tAA5xG4F7Znk72syJe5Sf0FLXC/z9XsAywd8oWLGEl/bWk4gmJ6MD2wPXjXK
	2Ihn7087LHVbymtk0VUg3rBHIaK0RIKH5SrBnFm+zEd62RVJMz2exl8YdRcSyd2xF0l/Kl5Sv5W
	q0sG8tloxJJiBHBK/2etEmbuT46w/YF1fkETxWNNlG9idyqn8UMB6Lja0a1wmisGggm/4mUUJSJ
	g2pJqAJdxENJOcyt18BH3frkrWCnFO11+kI+wxL5KEyBCqU/0SZZLtSDk5qV/huExkYAx6xELSF
	dBKXJmc/yLyVie9u+DOOqs8HVs0Ue4/gAoVNmPxOsMZzsXqRmkThe96eVs7gF+3CCxqPXCFyo1e
	DRj6ubEbtbw2nhLpkaZmXvrACuEfEt0FcHuFjXQ==
X-Received: by 2002:a05:6a00:3c8f:b0:882:d8c4:17c9 with SMTP id
 d2e1a72fcca58-8b66e343903mr3314714b3a.23.1794222116824; Mon, 09 Nov 2026
 03:01:56 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
 <20261105024106.338791-2-shengjiu.wang@oss.nxp.com> <20261106-savvy-invaluable-gaur-7af1b6@quoll>
 <CAA+D8AMxrUb-Pj74wrRn=vEyRUFKWWsR4Eq1LZ2ErsX=rRq=rA@mail.gmail.com>
 <80990ab6-5072-43a2-b829-177c956080c6@kernel.org> <CAA+D8AMt-_=XqABMoeUssasrmChJem7m=Oj+sLA6qnNORTZ+dA@mail.gmail.com>
In-Reply-To: <CAA+D8AMt-_=XqABMoeUssasrmChJem7m=Oj+sLA6qnNORTZ+dA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 9 Nov 2026 19:01:45 +0800
X-Gm-Features: AclHuK-vLDzqpNnq7WjP_EKkxW9CPBRL2HdSB_SqKuNRWnq2UdqsNh8iwWDBhD4
Message-ID: <CAA+D8APyfdLR8cvq3GMuF9UdQ5yM6LNSwwuvt+7rYaMFPk1Y8Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 3:40=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.c=
om> wrote:
>
> On Mon, Nov 9, 2026 at 3:29=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> >
> > On 09/11/2026 03:22, Shengjiu Wang wrote:
> > > On Fri, Nov 6, 2026 at 8:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > >>
> > >> On Thu, Nov 05, 2026 at 10:41:03AM +0800, shengjiu.wang@oss.nxp.com =
wrote:
> > >>> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > >>>
> > >>> The HiFi4 DSP provides a separate reset control for its debug logic=
.
> > >>> Keep this reset deasserted so that an external debug agent can acce=
ss
> > >>> the DSP and perform debug operations.
> > >>>
> > >>> Also require the reset properties for the i.MX8ULP HiFi4 DSP.
> > >>
> > >> That's ABI break without explanation.
> > >>
> > >
> > > The i.MX8ULP HiFi4 DSP has not been enabled upstream before. This ser=
ies
> > > adds the DSP node for the first time, so there should be no existing =
upstream
> > > DT relying on this compatible without the reset properties.
> >
> > That does not change the fact that you break ABI, does it?
> >
>
> Yes, it changes the binding ABI. However, these reset controls are
> required for the
>  i.MX8ULP HiFi4 DSP to work correctly, so the existing binding is
> incomplete without
>  them. I will add this explanation to the commit message.
>

I also think it would be better to split the i.MX8ULP reset requirement
into a separate patch. Does that make sense to you?

Best regards
Shengjiu Wang
