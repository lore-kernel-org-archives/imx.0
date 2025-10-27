Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1492FF658
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 12:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761567204; cv=none; b=TM6Qfd2J6B3FrAJd7cnHGdPBv+etxaSUYxtAxHdOJZNVcSHVfGsIH287RfAuk4TSgXyHpaTxZaEYt84YI6Mb7f/EYLheT21ma6Y81AQ7A977nuLuhghYstx2tWXrDZ/yqhba1O+D6OVeSi0Eod/J8JvS/BRx49bF2DW113JHCpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761567204; c=relaxed/simple;
	bh=wRnjBnuhyqMXvpQh9LLMBSoQASKq7nZHyQViUHKVz1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lJZNRspfCnVOgxrJfVnR2ahIV+lAA17tcQQgpHbTdg5zWSsr4z5A0YJ2VP7tzJTTdAhONqoH4JzMVgS/9oBUvdIxHbuatarvrr+2JCg7EM7A3MP1Vajt7UWIgGETY2jtaKcAt9L8qOc9BrwbVN+LBQAam1p3uexqD1EJykASTuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtsX71EM; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtsX71EM"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-378e603f7e4so35753081fa.0
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 05:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761567200; x=1762172000; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRnjBnuhyqMXvpQh9LLMBSoQASKq7nZHyQViUHKVz1M=;
        b=JtsX71EM9NoL1LzIptJm6X7Pn6yYymFoPdz3mC+iWeCl3Qmw1ZnVnWVsvutko61K4x
         CExhqdnsoY4xBChPyglTxnUPzKEs/hQMwqc0VGcx+Ut/Q/Z167ZjwUSOHr2kOePahxx6
         Y//Dsg7H8wku5hnlHO1O6VQnwfY45L7oVPLYAIBt+w61TJ6kVV46v5vS5p71I0R7x/x/
         97llhWSVZcj/wmEA9xpLbJIZ4ucHezTRcvhJyTExurYSZcz/cvMcVkTGAhi7CsxBEMz7
         q4szJSK0dNn7t4AIQFNhPRtiuyN6aBNO8JvBE6n5kBIW96QXso3d5ZvS1JzVNxFgORdI
         PESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761567200; x=1762172000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wRnjBnuhyqMXvpQh9LLMBSoQASKq7nZHyQViUHKVz1M=;
        b=SJIN8j8Wd6ocdy79uqf14UnMUcszdlOMgHFLnHXrDtKaYwCxdtWdpWHp78cBgmdROC
         BW81ZzhiEjeGz+XCbHksNcW1JlqH/3t16jUUwVHvYYfAI5PJgqPDcPbKWMjFuYJtyRDF
         6thNMyjT0+GC/Y5WhqIcpm623YbYBEGDfR6gqbYSQ+3EIHZrNhq8t8KhPGEeEVI5pvB0
         ZW5B9zyLjZImGV589CPxO0y5dwG0oIeR7sfk8hD8zCrkLFaG3gEC+UQOLSAJsSTxkYVM
         OvQrfcxOsVQT5QNGZkcbd0jYIM1Tw3+Ro13ugtkNOAi67LDzxS26hd0aU8yAlJ9ZyIaG
         EdAg==
X-Forwarded-Encrypted: i=1; AJvYcCWSeWvDnVsMG3+ZwkNHua7h7+O5dzscvQZ7wv1Bum+tMpABjsmDibLBifXOnUDNfeTrP1E=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkPYLos0GqCMFSAoO/2hHsyjGKSwQlB1GRRc4PULbsfnvVuw+2
	QKd+RCUrZp4MYlemT4X+7kAk0Cu+Gfj+C9hJFZpcT5CsyIBJQnSTx5nXSW6DEyizB8coHZA62JO
	adB8VvDhduMqNLU+NZuvzLnLqiHv2bOY=
X-Gm-Gg: ASbGncsJXvQ+ZTjIuH/NRfPCLzRKHPYsQDlDoIMngK34BMw9omPC/iUvf4vBgxlSrD4
	ccnwF0ho97uglJevz2+DH70aQE1OGkiYewJR20mMrgZXvMHswZgCgeKYmlu+MAqbPUeQc8R/nGa
	ZXN0PZ9/9vLKp1YV63QPSl7cKEDxramdQGRDrxbwtT2QkFm85AstdSrXoN6C1vbU/f4jpE0hqCw
	QBUR+qeH6szh8BCwbAzHT3eMshfTGL9Q7yKIVrTbXNAro6a65qmiou+FIvBQB4FjYiQ2kuoLXMm
	RTszS7rVsSsFGonxU9qKdLxSEfo=
X-Google-Smtp-Source: AGHT+IFFfKN+siPeEk510LCYlRaBchkOKpAuwWhbm3bWGz56uyRA9KKdEl3XVRQWOc57AU14oMs/9BA7nmAnn1K3lvg=
X-Received: by 2002:a2e:be09:0:b0:372:8c4b:8065 with SMTP id
 38308e7fff4ca-37797a2cb95mr104193231fa.26.1761567199979; Mon, 27 Oct 2025
 05:13:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251027110406.543370-1-carlos.song@nxp.com>
In-Reply-To: <20251027110406.543370-1-carlos.song@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 27 Oct 2025 09:13:08 -0300
X-Gm-Features: AWmQ_bkk_6yx_Hjl3n22lrPiupz3ujJbjohrrhluMrC5cpjjXVzvvJEhkBoNxhs
Message-ID: <CAOMZO5DM5NyGdyz4_6WF7qcsMmjAdQvfK0AKxZprUfhC=882pg@mail.gmail.com>
Subject: Re: [PATCH v2] spi: imx: keep dma request disabled before dma
 transfer setup
To: carlos.song@nxp.com
Cc: frank.li@nxp.com, broonie@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, linux-spi@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 8:04=E2=80=AFAM <carlos.song@nxp.com> wrote:
>
> From: Robin Gong <yibin.gong@nxp.com>
>
> Due to a hardware limitation on SDMA event enable (ENBLn), the DMA reques=
t
> must remain disabled until the DMA transfer setup is complete.
>
> Refer SDMA 2.6.28 Channel Enable RAM (SDMAARMx_CHNENBLn) section:
>
> "
> It is thus essential for the Arm platform to program them before any DMA
> request is triggered to the SDMA, otherwise an unpredictable combination
> of channels may be started.
> "
>
> SDMA hardware configuration is postponed to transfer phase, so enabling
> the DMA request too early may cause unpredictable channel activation.
> Then keep dma request disabled before dma transfer setup.
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Robin Gong <yibin.gong@nxp.com>

Should this contain a Fixes tag?
