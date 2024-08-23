Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C88364AE
	for <imx@lists.linux.dev>; Fri, 23 Aug 2024 02:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724380440; cv=none; b=Gk+E2nBfhkxCDmdS7/z6JiH7LWrriDjVuNAM89ZTl79h/ZHDW7kCdIOQfKtggH3xh7GlP+Zfb8HmURsXw27ofme/2U2haaLJqDpQQc94dQQ4QTwmS/fUCtTgS7PGSZBfRK0vL6AfbhSpg5KI51HosTAQ3DYHBKJKGOV/6mAV044=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724380440; c=relaxed/simple;
	bh=0drhQ3ovFRKNzIjwdaG614SuVDwFNryZz/8uyTNn6cM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rmZAaxL8WdUk43cRyURdiCaSJt4GQAF1eoGJc8a0cgSSgE3M2Oy1T6x8BvfaNlQ9BjLIgqK/5ZBwDMcT4dccgXgdpedqtD52B9CsFoiBP0WwdzNIgCRvbm8n4FJlKGAQOTAmI5H0jV0wSvPSqZsLE6CWhJLzEFL36dxQ8yxkGic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJEzQRrh; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJEzQRrh"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5334fdabefbso1235871e87.1
        for <imx@lists.linux.dev>; Thu, 22 Aug 2024 19:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724380437; x=1724985237; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrIprG6+971o247HqoCovPo3X7CWv5qYe+EIwKsAYaM=;
        b=TJEzQRrh+Lklx5WX+aZWI2FHdxvB1l0UL62Ko/THu1B6axVmFLPUwufuAOXH4z9MF5
         V7MKgbUGhH2kwhXzD5LKMNV1/mIbJmN9wstXKrVACAmGg6n5OaGwkH25vUV2ptSVQ1P5
         v2RT9a2+iyPjX3cQ4u4P3XyJ/3Bj6eopvSzFNy0zMw9dQnPeaswF/KaLBfCHr3U+htED
         vn9+KFKLEn8BMnQxbtyEkqIItY3ejwARu7FpbkN15S7rZTqc2n+r7Zi+pC3aJ+CasPgl
         6xtzyf2kbxlm3zbsWld8VZ2lRHnifK04yMH0Gt9o6HfIXzo2b5YOvgT0gcY9gWpr/WcX
         KIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724380437; x=1724985237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrIprG6+971o247HqoCovPo3X7CWv5qYe+EIwKsAYaM=;
        b=FSj7TDfSsJkCcrMLqhhdEU4SS3kPAgvX5uoPr1ji2UeGXvKJLv7uLEaYEGo9kjWRRB
         gUGzMcK9CwnYoTGN/tSAoxQKa9JpETNqc3W3wZSfCiaRDxPZWGWPDERY2zGK0ViQUR+h
         XCn9AT+UBh5flPbA14jLC9qsJYn2HKrLTlbz1hKgE7VgfO1+kI4A+8vau7hW9O/cz0Zk
         ACmbcGXvfUd++Ob2HHJRhgkvpzkRKxPFb4BdGXyAXES5L0W/RJA7kfuc36yi1leGCVfh
         MniSmYsLDWldxsVJSq2VvH2AQ3Uakx8M/o4vydegNTmPV5eCgK1SVTKOfY+BiPJyhn97
         pGOg==
X-Forwarded-Encrypted: i=1; AJvYcCXqdsD5sUP+o7J9LqD/jmc3lD+WUAABzsDVsczdyPgRkasQQMzcYTYBRqYUO0MnzNRG7kU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwghADJWrAAk7+M82cGIpU041M++rlUeuHKPBo+CBF15n7Fs24U
	08v5Jxf3NGLEQHtggGy+vq2DnPCe2Xq4H7lQhO4WhDZJ6OVfPj+VEYCoLH3nnH9jFIDqD3NK4Fv
	lFYGn672wdC9cVSEgm/Ywd4OZsPw=
X-Google-Smtp-Source: AGHT+IHYduY6Bb01ov6m1nK+wYU1FRksz0uASiRqqi5faWdM3/F/fu+SSoDtEhkO06XirtE29Ltt+Ug34PCTBcV3qz8=
X-Received: by 2002:a05:6512:e96:b0:52e:fa78:63c0 with SMTP id
 2adb3069b0e04-5334ca84c6fmr1701817e87.13.1724380436483; Thu, 22 Aug 2024
 19:33:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240823021257.1067054-1-victor.liu@nxp.com>
In-Reply-To: <20240823021257.1067054-1-victor.liu@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 22 Aug 2024 23:33:45 -0300
Message-ID: <CAOMZO5AN=yx5RSkVuMrym1QF7s622gm8+Qnf09r9mgZKr5sypQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx8mp-evk: Add native HDMI output
To: Liu Ying <victor.liu@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, 
	alexander.stein@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 11:12=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrot=
e:

> +       ports {
> +               port@1 {

@1 without reg =3D <1>; will cause a warning.
