Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB6A45948
	for <imx@lists.linux.dev>; Mon,  6 May 2024 06:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714978231; cv=none; b=q4igaVqJ7SJX4nHXoTOr54pJ3rH3u9FpXBbD8WQ4MzwZGbebZ7w9IgrCormJE5DOhl5sqbIxLxOz9H0cvNo1A1QTsis/6R2GPqTa6fFmiAgxIzjnqOJyK02kvvuVtmheLPxitMAnGabu2EcRb6OXGV7HSYL5XTVOV627rw0cBSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714978231; c=relaxed/simple;
	bh=t9sV+2F9GsZsxXoVrTVg45KxuJajB4PCBQUzDfGhbxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K6tyKgVFH90wUOanNVVxqUhPnqirbL1Zq1D0saW7fTYmjPbdOvA0TLnZmtqnx6scecgkUXlV5W1OXYyjPMu0FDSNxUudljog1kMrQ00uSBQcShcolfpLUHTwwGkPfNj+B06fSQu4q4PhUpPSZtQ4MprLeCcnbaFr6Ngb9ern8Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/FLQGWp; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/FLQGWp"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-36c6df3d735so6864575ab.0
        for <imx@lists.linux.dev>; Sun, 05 May 2024 23:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714978229; x=1715583029; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwossjwusBAm1BptSw0GFVmeFGQRWSG7xTl1Y98TkIE=;
        b=B/FLQGWp9tkwhc/CabzsWGlhXJgqF4BblvrXljuk96a54O/4VP3y2ok0v26RBWBq4T
         HxN3a4/iShnaTAJaNbWLJ28WEJ6D8ObbCVWjXU41uOYoTIlp1tXWHzXW2Ncm4DpZ4xDR
         1cq81ieCUmFloVbRxGiN1/p3aNeIps6ITPHTN6fHSZBijUpjZmQu9k61S7CZsyIoQrRQ
         Hi3aXOZcIqpf3S7Ijlq04E/N/guGKH7i2PCwZSnqbzAK4xOCBLekqm81RQZxPVWp21IE
         Gy5BQ/jBG4B1YfJrX/5mxcQjhDvJRGH7sibzBG3ocSqtFfMQUJb2gmuCKAjqFfHOnUx5
         nmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714978229; x=1715583029;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwossjwusBAm1BptSw0GFVmeFGQRWSG7xTl1Y98TkIE=;
        b=XHuClhU36ELVHfjCp9a+lAN+8fngvfC498vHoDCUWuq8PnzTK9sPgfBP7kIU4n+1c1
         k1LLV2LHkHFFeOHo+/4r7J6pqCLpic06iNjJNko/7U/oNE/uuxjds1FAD+sOTcSTHQgF
         pxWRzxmnZFKEplYJlMDfr8gV2RNPexK5VI61wa7LBPW8hcmbFPsiAnHTAdOEDmMS3zrD
         sYT2juqJoWcBmoExtd8Y7lGwQYhrHqE8ckwzWglPA2p9Pr+4SZUO1FHKDnmWQwE8tBeQ
         tNEVOBf8JPAZa3I5aJf7PaddXM0eaM2YBXCuwkAumSrJxO3Kg9KfAsf0al25xrI0Rate
         lUUA==
X-Forwarded-Encrypted: i=1; AJvYcCVPeZm8nHWbxGoWDRVUqwkHVygDm0HsYUznNEs7cU5mxImm2HTXEbNFKlcb5vkZzllhDHzs1PYA8nkLlPtGW5Pw/U3Z
X-Gm-Message-State: AOJu0YzXnZvvefSmDcY0HvQ4zC5F3QAWiMGb5HgeoL5DF49EAxp8EBGA
	9cB2jEsVvOJgY39OAZYBsVbaRLqJ5FCkjusqPRs3+E3e2oPLsVGC/F9JRA/1Co8j+gKfxBEdzbJ
	BKRw4FItPjA4/LSPiCyF/MZzVuWE=
X-Google-Smtp-Source: AGHT+IEm4rLVnE5ZzKrznJT4pumjG0pJt4f5HUbndOlm0YGQ7AvoJGI7vs/cwAljai1Nk7rIaImNgMmAPXsXJkecUw4=
X-Received: by 2002:a05:6e02:1a09:b0:36c:51f9:716a with SMTP id
 s9-20020a056e021a0900b0036c51f9716amr12210835ild.13.1714978229138; Sun, 05
 May 2024 23:50:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1714967359-27905-1-git-send-email-shengjiu.wang@nxp.com>
 <1714967359-27905-2-git-send-email-shengjiu.wang@nxp.com> <05365b5a-0398-4382-9646-a1586468ed10@kernel.org>
In-Reply-To: <05365b5a-0398-4382-9646-a1586468ed10@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 6 May 2024 14:50:18 +0800
Message-ID: <CAA+D8AM09392xgh=iKxrgwYfJ=3YHmGpbE7yfH3MXnrMNNsm4Q@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: clock: imx8mp: Add #reset-cells property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org, peng.fan@nxp.com, 
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	marex@denx.de, imx@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 2:24=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 06/05/2024 05:49, Shengjiu Wang wrote:
> > Make audiomix block control a reset provider for
> > Enhanced Audio Return Channel (eARC).
>
> Why? Commit msg should explain that. Why suddenly this became reset
> coontroller? Does it represent hardware?
>

Yes.  The Audio BLK_CTRL contains clock distribution and gating controls,
as well as reset handling to several of the AUDIOMIX peripherals.

The register at offset 0x200 controls the EARC PHY and Controller's reset.

Best regards
Shengjiu Wang

>
>
> Best regards,
> Krzysztof
>
