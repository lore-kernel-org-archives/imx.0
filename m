Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794210055;
	b=jYxIcPaXB1r6KtyV3IsQpDd/nUyLwpWEKfRFcx7ewP2JdOxrD7NeqAO2C3Ck86CWC5/P
	 vosrSjiVI9CGpY2eQP76Y/hbuFg1Rebju1RZHi2v28+WJC6DXpoI386i6I+cNe6ClGsYQ
	 iXt/LPlTswCiZZ18cyWD4n4R7T1fbwf30b+GbIFqmU+Ai3CyKCazRXDKkiv1f8s5ryOz0
	 gn08BJhqVOPsDWXh5WIZ9O84ga6SGc6cIqWTYQAy2vLN+Qj140w+nOnWFSDsUlLsUi79g
	 CEgoN+kvP4FGdGj87uv/Y28LuxHV4PZVxBqdQnJTXfvHjbmvlqYVBHu6DLjMK+GMtZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=;
	b=JEeVC0bpaB2PwKejIxg55Va1WJvsVas4gVu9aB+vAOM1nC0TmJDe7pfcDsjG1rZ309g1
	 pqicZMmNFaQIp72kfkB0Qp0mW+M83cWSYw2ZjJeiin4LvwkhyJ1yeHskyYxyL0rxO+J9z
	 AiQ6soxWWH0s6cW7JlDcOQ+4Jt3k+lu4iP3qBEZ/tJ1adOsrB9f+Q/MDQ3TNl+NyV7cI+
	 4SOqBCuui/AnubGUiV2F9T5H2QjRlVJfPjL7ETCrxDfwL5qSwETrs1Kw68FbeYA4nOwRw
	 OumwCuXlgENNealtGPEC/9fCa+K10cmvpbQa8yOICcpK1uuiQV519oxT70kbQvU5/eA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r6PaTqy+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5767606A31C
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 07:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5767606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r6PaTqy+
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so354044a91.0
        for <imx@lists.linux.dev>; Sun, 08 Nov 2026 23:40:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794210054; cv=none;
        d=google.com; s=arc-20260327;
        b=Cd2g/pod79w26wqCbrdjG1cpwTRIWtTZD4YxN+VDj38HGJaULjOWhqis1pmJGjDqB3
         UIEmSJpc1vnfhFBtAbn7F1Lc/JNp3CGORoDiNFaCTzUDilZfUN1f7KG0BER/0AYP177y
         r86AuOWo/iW/MdARX7/NEAXtykCwWitavog65coek3SvIyZw3TyEDqNUurYQMqdy5SGq
         C9b7oR8VlZDxwvRMjKWmTk01QnKTX+dghlD25IOYPLv+QYBLINGCg6uz1dTSf6h4swIJ
         ZdS9eBiVFOMdsojq1oSXR2R0V/fBl3caANNPbsn3btr9acnU2zhyQoIV96DMAPK2oRZx
         HtOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=;
        fh=MqfMgKrRcIEV9C0aXreJpQD2nZK2/xnVLPpCeIHfrrY=;
        b=Re9ZgoeoJGu5ToqZ34skTXDwFX7TkzMpH4qozjd5RQryrKqH8apjEWI3BIjI/ybkGr
         QsMhXmaHvORVXaQsmxolaEZhQWPv2JTNYkJyQnkvVq0T9JuOj1B0gzCH+o2YdisSFKsl
         3omNR+47fXuv7hxNUePTwd7CM1SLBR/GZGvqKQ6A1S0LUOJyNw8eRrK94j3O7v2Ivfwo
         gb/wFVY9U0ZgNHaDpqmNpOnIgA0y9B1Qr7hEeBwGkwHfIZNEOBe8EwTpJ6gosNMOXiHm
         6GAEI51yyt8dztYeh964pWQ2uHLq51aSxh6UfdcgZMZwQ8iOmYL4lFgcWqplQR85pQPQ
         pODA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794210054; x=1794814854; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=;
        b=r6PaTqy+ISRd/iCQSUh2sC04d2yQROztKqLhEJqGz+FxBthk8FI7VoAj1QBec+/liy
         +KvXebbJ4usmRKSk5GRhHITttNKtlrLQzFOKCDGaY3jOhU4TFfQ4bTBtO9uph5srbxkI
         UAra04pK4R7EgB7Ph3yZxo/c4et01HgclejoZU/KpK89AzqbM3StnSZHzjXPfvP7LILs
         zS8aw1Edmau5H0T/1eJNHbTVzI43Rioebp+DQoacI4O02V5qOXIn2jSFRJVJVuv+FdN/
         TAKcEcy7uEGrRWZJGTFYnEPOX4mgXA8xnFPTi/3eLCuV2OZBOPFSLHqT27etBOTmuJoc
         Zsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210054; x=1794814854;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=;
        b=VNQkufYIm8+mPiCAm0m2XW1EbWsumKYa1oKxh4omCu+FSHl9W5gs0h3SFma6Wh0GOp
         9v0uDmObBPiuyEZwUCDh6Scp4aUlbScCUZkNJ1ot91BWWYld02tAgHDMB1WAI5IFsPC2
         lMxg0vxdEfHf+i9QPBhVB1hIinSAEUg9qKG7pBwrbj1ZBAT1774bMb5gDVH931GW42kJ
         KX0D+BtFmp87vHx0lik1ogDzWE2Uf97xNcmd+HDKNqu7zkbhjvfuTx9u4krO3fatyB1G
         V1TC+ihHajrCOWwWtEH3AD7CnUrgFwmOFoFBSOUtWcmqJl1R+2FK/t5JJUsFW8hwXDnA
         W/Rw==
X-Forwarded-Encrypted: i=1; AL+hErEUdlLm65ZMVSufyebVGf+0uCMmkH2yMzvxG/Dc9PHQYj0J9oMZo6mIWl22aylbySSJ00k=@lists.linux.dev
X-Gm-Message-State: APuU4Z8WSbofEfgGYNg9KlLmQ5u8IwzjwkHO1LOn1yFb+/qr7mPl6SeS
	9PJgAUxJnp7/TXDMdBFMG40moFHHIftCqf6KlKOsacWugAdodLhTZaY3l1THTZ3xI7cvi78lrPN
	hWPl3KIc+HKqSDISjG9UUwH9xaSEs83U=
X-Gm-Gg: AYBFou3tCA63dX+zxXu6jDWrQb+5IiaohoH5bY7lFsVYlNKpxnj2dt4X3ix6G62b2NE
	xXx97xKS2HMDe2ga9rGCgAUkoJyfgqVcUMIlzpZkZaG8zY5YUaU6xrdbG/YO8BPc8A00qL/S1qY
	WHmqcUPnCEs2vwVOoJmhvCtQmQPpvUzpCbfylC0erGdJ2G97DhprQ68jbzl8CM0BVhIGUjNFGEP
	bCzAeLVGmgYoHxWcKdgYdf6s5Yb4XztPzvOGm0Ibhot/7ZqnjJ2m7429E42g0EZq58A8GfABjoW
	QFo6FG72sz6vqV1XVxNbufAYvmrtiDk/IXV4jAVUgu1QdDWF084blRTo3Hvqpr8RmlfxpOhCGhZ
	vqwlfZiIHt2rAJtjsphGDk5Nxxyz0K8A4xsJa
X-Received: by 2002:a17:90b:2692:b0:3ab:2737:3393 with SMTP id
 98e67ed59e1d1-3b12d4e59famr3159700a91.40.1794210054212; Sun, 08 Nov 2026
 23:40:54 -0800 (PST)
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
 <CAA+D8AMxrUb-Pj74wrRn=vEyRUFKWWsR4Eq1LZ2ErsX=rRq=rA@mail.gmail.com> <80990ab6-5072-43a2-b829-177c956080c6@kernel.org>
In-Reply-To: <80990ab6-5072-43a2-b829-177c956080c6@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 9 Nov 2026 15:40:22 +0800
X-Gm-Features: AclHuK_S-BK2XU0WY_pNWrUm4vSuurn5YOkC4y9TAw4Ztjpw5amiTRF4mk36wDg
Message-ID: <CAA+D8AMt-_=XqABMoeUssasrmChJem7m=Oj+sLA6qnNORTZ+dA@mail.gmail.com>
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

On Mon, Nov 9, 2026 at 3:29=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 09/11/2026 03:22, Shengjiu Wang wrote:
> > On Fri, Nov 6, 2026 at 8:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On Thu, Nov 05, 2026 at 10:41:03AM +0800, shengjiu.wang@oss.nxp.com wr=
ote:
> >>> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>
> >>> The HiFi4 DSP provides a separate reset control for its debug logic.
> >>> Keep this reset deasserted so that an external debug agent can access
> >>> the DSP and perform debug operations.
> >>>
> >>> Also require the reset properties for the i.MX8ULP HiFi4 DSP.
> >>
> >> That's ABI break without explanation.
> >>
> >
> > The i.MX8ULP HiFi4 DSP has not been enabled upstream before. This serie=
s
> > adds the DSP node for the first time, so there should be no existing up=
stream
> > DT relying on this compatible without the reset properties.
>
> That does not change the fact that you break ABI, does it?
>

Yes, it changes the binding ABI. However, these reset controls are
required for the
 i.MX8ULP HiFi4 DSP to work correctly, so the existing binding is
incomplete without
 them. I will add this explanation to the commit message.

Best regards
Shengjiu Wang
