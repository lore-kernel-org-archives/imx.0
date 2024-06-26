Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDA019047A
	for <imx@lists.linux.dev>; Wed, 26 Jun 2024 18:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719427141; cv=none; b=mRG+i0ANlT/2MYm+MpRI8RIQT1qVEX8XVGsUhKASFcGMeqk8k8fHry1GN8xxAPaywvEJjZHvH9lo90JxxrCH6bODiC/ExgoRDEliTOnSqptUa+n1sIanDLDOIAWLMl2ADy4SDMc0AmSBSD146y+jfGFfyVuGIotVcNN0HMkKipQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719427141; c=relaxed/simple;
	bh=8RC4RoOdepfw+QoKH1SDT3cAhXv1FTN2Q/e15hP70WA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d0OfY82goySwkfBpUX9Uhhxq1B7Vw74HBo+euuJPE15wWInhXkbGh5EjZunLCJIwbil5v9yVAnHNHEmdkNrnbgJOFqmB7aywm5fmY67QQTrtBTsgMIhY7E5i5SHqREc8MwUNQsJzBZvZ8z49jD09zUoHFiumbVTOc4GIgFJ/XcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XpFJ/2+x; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XpFJ/2+x"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1f9c4ec8e04so3239785ad.3
        for <imx@lists.linux.dev>; Wed, 26 Jun 2024 11:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719427140; x=1720031940; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlrWYffJsTAsz9VBvDLLrbP/qPvWI/3vn63/l/yn9OM=;
        b=XpFJ/2+xrWyzOAD6+TcnJHRxu/+h/D42bEoDd9HzxhIOz7kugoAXLmQ8ipYPANvuZ1
         PPPMvcmSCAYCvuubMkwu78zE5n1cYLO5XsG6oVeFAFsLMPD7qRwLNJ2lculTuPggzHos
         XKEUEpiQMCPKczoJIfINkZxkZQnWw7X/Vd16R7xcO/FcYKsPt3o/u17YGtRHNnaDpVeT
         ieYFvD9C8hW6zSDJUd7UTuOWGatLBGo3Z8yOi6vsx91XTmLXCPAgFkBO8w/0Iuss4emS
         JvdgJ3GIna5+zcG/nCVS/x+dfv57pei7T8cPa/l+XSEFlARrSI1LtAJByu6v4ejGsScq
         Vdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719427140; x=1720031940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlrWYffJsTAsz9VBvDLLrbP/qPvWI/3vn63/l/yn9OM=;
        b=gw4GOLCKlyF75AymZHgHoKpUWyKe23QqCU7NJ4o5n51nXRKScKorTRqu0X86yzBf6/
         bTnac9E1pbtjNN+ZqJCKHS/TXRBEStb9kUSu52mBH+4lC9/8zbc6hsRgfYYzXN2BZuD4
         4gpAxNmStOJP2fcuE/tBmR7mzxpiMeH0txhTNGBAWJqs1HAp6sj93per+383bNzrIaGp
         Mog0REzCaodYSnDx4uNmqpZEGqqzVHOY/exoiqLGcVc6EobkzeAN7AeQui5MQ3JuWE2+
         3NS1pT81CUwI6/17CG8WRmqRF2r1TXM+hOo/oSS+vmW82qqu5fnNVVxolo08dzpHMX67
         Tx0A==
X-Forwarded-Encrypted: i=1; AJvYcCWoksHw9v2EfluRwI/2jQyTdBA091smW7/v0zBuuxqAXZ/dH0o1A517alQmRQ8+Fn5OfKfLyspwXFkTrSK/It0LzRdV
X-Gm-Message-State: AOJu0YwjI/7sxZhDmvGhIGXTrwZ4nDCO8MaLPVhsmbzX4F0nhk/kS8YL
	PVz4y45IIlcgwxia+c7BVCgCeuFHKCv02/MuIimqhZNeRvBDiZ6xf1P/cEXs3C7WFvtXDRM2YVN
	88nXUve19ulkmXTp6qPPpSDAu1Ok=
X-Google-Smtp-Source: AGHT+IGzh7OgcwAD1W7O2ToIpYiNPYaELd/OyNMBI7wyg0Qn9LTacpa85jfZ+S1NzS3Y42emCNPSM0U7vxCnFynye4k=
X-Received: by 2002:a17:90a:fa96:b0:2c7:dfb6:dbe9 with SMTP id
 98e67ed59e1d1-2c84298b2demr12120553a91.4.1719427139827; Wed, 26 Jun 2024
 11:38:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240626162307.1748759-1-Frank.Li@nxp.com>
In-Reply-To: <20240626162307.1748759-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 26 Jun 2024 15:38:48 -0300
Message-ID: <CAOMZO5CQHMzhvP9KqPahWdeVjBvqk758uY6wMzVO4oPrt=pECQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: net: convert enetc to yaml
To: Frank Li <Frank.Li@nxp.com>
Cc: krzk@kernel.org, conor+dt@kernel.org, davem@davemloft.net, 
	devicetree@vger.kernel.org, edumazet@google.com, imx@lists.linux.dev, 
	krzk+dt@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 1:25=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> +examples:
> +  - |
> +    ierb@1f0800000 {

Node names should be generic.
