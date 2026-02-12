Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33AB0171C9
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 09:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770887816; cv=pass; b=hDUw1KndemWxppDye0qARU15MBZMBWCZcMwMDMuxorC5XDDNQzfsIn9g8jlbjDlmRogysFTDLjIzdYApcEO7iy6Z/XZbO7F2040CIFo+XjpZo2N8prJUrrmUzJNPdIMK9IEz2Iel3YLdI0B5k7fdrWttGWP9k/lQHY0MeDrimLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770887816; c=relaxed/simple;
	bh=zS4kDFqVFAYV6avPugBwBxUezU0hGe/pgYjawUzsRSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPsy3mMYLsvZeCnrjfv1HUMOScN5TuxArGZ9oXmcP6J2siuCD3VKUREMxoQka6Dn6QRnhEsmF+vjEWjJG+LZhO/fdjErd6jH2RJFp+BOVg5O8nKxZaXQtsPhe35VuCuwq17G/gI+7WYwzJIIOYwCC+Y81K7u3f9+wklQilHkLaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5Um0fQm; arc=pass smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5Um0fQm"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1270be4d125so7471691c88.1
        for <imx@lists.linux.dev>; Thu, 12 Feb 2026 01:16:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770887814; cv=none;
        d=google.com; s=arc-20240605;
        b=TwDjTsC9qXi49dSpMJlLkFzwC/L2U2UwkXATSgeFR86juAO3inLfFkHTSjvgdYlXTF
         iMBIjJ4mr7REbhYkTsq1Jbb2MfmKKyes/4IwZ9s4i0sKc05mVxzPO1xitAp1ovEpmIfn
         ezMCK26Q/rfvy/P61bnF/bRYtbvNxsHgp6QLJRSc3NLy0h7vPiAi4Egwyu0fwF4g9ktW
         XAYbuXO01n2mVuorW9OWvTHejj+3H5dbQ7AFpY98gLlWMmrH+QjeYOfRk8sUC1I3OiiT
         Hm7TjGvzfCjnQtVUmsHMhYfb29JnZI0C6+M4KKoqHpwoJRaSsIx8W42WpCpj9Kd1RC+D
         3xLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zS4kDFqVFAYV6avPugBwBxUezU0hGe/pgYjawUzsRSk=;
        fh=nspDOElOnMocZ7r4pQVTRL1/3RhOM25StaOG9NXaR2A=;
        b=g9QNb+6FdfAcYauiVtHcj1+RNpU8YmFOKSQpY6/bOFx1YTiP0STNOqZzGJTdlt9B3B
         5sdlpjhPhmUE2KO5MsOsLuNqaNl+MnBTb2HOMGxBHTIbNkZU1ku0rqY4/H+Md1BORMWE
         r5sbtobHEcxbx/Azukq/80hAfA/D5Z6/yAx65h8yiwg4kQzifNNOnAy+JXiXQBtv3UL/
         9cCdmtrDJtVRjw1OtuZ2BA5jv6g1mpGUAhus1OB1hhVDMfTNmfJ03YcM8x3lYO34/1Mn
         kD7kUsgIfh08y3D+yiaam3dGkw+tVdSn+cA8K+zXf/f8vjoYWaMSHmAV73lQb7XPbgQY
         Apiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770887814; x=1771492614; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zS4kDFqVFAYV6avPugBwBxUezU0hGe/pgYjawUzsRSk=;
        b=E5Um0fQmSwpwuGxOmQbj3VPEGD29v6Z/xtuT8iZ+lv2PNtUWb5tBuRQs/pnRR0pHs7
         gO3BLiffJO0q0mSv/zOOdVxxBIw71ggICW9KWDxaq1nDNir43nebKMSsbb3sYNIfrhrf
         x/uOVm2qkQ5Pb8S3tjYpCtmAC0vZpfT8xkjJjF6IUwC89mL9auEMl+qS0XMgLjKxO++F
         v0xrDHH+3jiGQJVH9p/WNwULPPQDoqJxJMYWM3NppZzghTqVuvpPxVDfuFjQG6JyfasV
         5Lo6r20crKTlY5XWGUllLY4EedBG3frSHbnjcjjaWAvzbt9048d+y7FhxXw8zjclsZM+
         R4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770887814; x=1771492614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zS4kDFqVFAYV6avPugBwBxUezU0hGe/pgYjawUzsRSk=;
        b=MG0+RbM83w5Q/06PZP8N3NLxUcm93FQZjn85qJQGsWTUcFvCjoj3z2JJ3/vLGTqAOq
         0LyquoSoreWgYiw/Ic8CkMtmvFowcqzDL6S5n20a2fG4s25rbBkeEuo0QYxTwH9oRvMn
         TCoJ3p6e+BaNktVESFmGKGkrzlBSg6TbVUMzoHKd7dq0WQScvatS0rSKqS+kpH35dxU4
         lFK7PDx6dwxpPTURTQ7bh/C5q+1uwXT4T6BcpnNi7Snf3E2NR7wByZEQjQV7wzEPf+jz
         VhX13V40juK2gJy9Hdzo5huSqh1b5od3W63OyFkHmYZvlv2aoVTlfin+tXPqyuYW/Mej
         xTjg==
X-Forwarded-Encrypted: i=1; AJvYcCXDtxOpS+sb1wZOknP9ptOWMSRhnCG4mMObb0Iut7tZt9NnioDnmmXx7U9+4FNz3sobor4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6mAZrMm/ZzG9mvdqdclcgdBvG7P2YUPoKgDfuTrXglnghjUkk
	wyShbQ6YmRXviX8Xt2txJhnvZciUNa0gGC9eW75oXAsxdsbbBh9LlCcbjHI22jqVBLfAbe64q01
	TrEdnswhAGx2qRdSmKiHRnWrrlVLF6Ec=
X-Gm-Gg: AZuq6aKrCYnAajQiS23WyfVXkF9Nr4rEvalbCftQNcojq/3yC1ioVXBWYcKfGHR1bJB
	Ji888fS8HI0ZDEJKlJePpD4WLeh6OHEycOFcXp17SNAtFm56/FLkN13fz6tgjlHR5fd3xuwecP+
	t3PqBxo0zngzEmCsJUFvVOsZ+RyXuoPOz+VJvz6bf+q5ovazqlDKXrZ6y0fVcuncSk047pt4u9h
	eWH3Ipf60CUrU3snqAodR/bWFsWFSst8cg4wx3pKUq1feNr2lzeG5mz7w7JNR6rD0Y/ovxmB1u5
	5SlOcKEFvOiC0H8NI+ZjvlAovOdn0wp0N1evvf3/9K3rZCydglqdsjHP3FXHKFdm3HC5+HICcug
	NZEvle3takHVIuj/gwgOCMmbGk0c07UXC
X-Received: by 2002:a05:7022:78d:b0:123:3bba:fc4c with SMTP id
 a92af1059eb24-1272f78ad4cmr962785c88.38.1770887814104; Thu, 12 Feb 2026
 01:16:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260211221529.3745404-1-Frank.Li@nxp.com>
In-Reply-To: <20260211221529.3745404-1-Frank.Li@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 12 Feb 2026 11:19:36 +0200
X-Gm-Features: AZwV_QhNdMRVd7V9qLZDvSol0fqxji4If6Iws3_V_J6-ZGNkbg2vcJ-9A6hq2Wg
Message-ID: <CAEnQRZBXrrhn0ZnuyGZ5sQYUCmkS0e_AU19L_edKxjqqBgvy6Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] dt-bindings: fsl: add compatible string fsl,imx25-aips
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 12:15=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> Add compatible string fsl,imx25-aips to fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-cmo-qvga.dtb: =
/soc/bus@43f00000/bridge@43f00000: failed to match any schema with compatib=
le: ['fsl,imx25-aips']
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
