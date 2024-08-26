Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12C085654
	for <imx@lists.linux.dev>; Mon, 26 Aug 2024 08:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724662110; cv=none; b=GOd7rvYke7bFSQjShX999y+MT5T1kd+WRWrxdOhPUqoQFeTJwSI2taPjZ4lvpQZPqSta1xrGBtcj5+GB6ymt7t3PzSIzjauf5kA02sBDHNJ+JN/OMudCxzT710G8s4Hsgo0P4SftM+HtRWz6//UE2F59ZoL0LN/+eWRU0k/qlaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724662110; c=relaxed/simple;
	bh=2hnjvVAoZ7bwbquiwr7BPEkR48jyp3TjmuaLIQPgQ/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=myIiqY7Nk+TY1QvP3kIVE4cKw1DZhUGAoRWV48lE3NAIAXx8uAVqwoO+OF1Bvfr4prFudsD+CbXzRyq2KLeWXW2bqulQJnvZ7Q7yUNUD8RGyOSOuid32J7+o2RtZfwdSFN87FbduVPqJOon5JshLCWIJ3/4tNVCxjhzawZyV/hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZnshOdjU; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZnshOdjU"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-533461323cdso4545380e87.2
        for <imx@lists.linux.dev>; Mon, 26 Aug 2024 01:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724662107; x=1725266907; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hnjvVAoZ7bwbquiwr7BPEkR48jyp3TjmuaLIQPgQ/o=;
        b=ZnshOdjUBE2/l//CjPlAGyvNfk85b53cAhFrcdvMa/Mz255Fqq86QCwWeOFJHnGUTQ
         XZGMk6zW7r6fl1gGh9cVfDk6gx97KLNlX/sY9KuSMibk5Ok2RvpwmyHxQDE4HHVLxigJ
         JwrNvOeLsSwDtLecoTuMZDsS3VCVLJuT4XsVospw0C3zh9Z8OmtggCER4ulx0qlbih0t
         yJDpURk1oOCU43S+qahhubqlNCsnufqxD3+BrE4NOfhiEwec6nfdsHv102/2U4oMC6MT
         QO2zIR7eORZve9wgtPczv86WNB07QGHArr2/x6PQsT5oHUNrPX9dbixoFToata5/XKR3
         B1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724662107; x=1725266907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2hnjvVAoZ7bwbquiwr7BPEkR48jyp3TjmuaLIQPgQ/o=;
        b=pMEjtb3wqwc1DGeeiws2bn7wbVc7ZwVdpaYGHSY9bh9Q5nrdQGc93f2HiKayFoYShs
         hKLF+oRUdzWx7JFtIwmpV3LeBS2QyiC5N6b/swb+X/uHahJZ1lglCGGdFMvZ8G4tyjR1
         cw5FFb3jb2gT7mozU4TSmRz0iijcdCoti+8k4E94B2ptixkU7koomHvAOrxllB+O7DWA
         r37Yl8eNi/7Abh0wY8oVGsmnAGvxkbpNOrg39w5nyNSIQnoVEUO905m3PqkefQYbAqtt
         +gWGZW7UsEhg50FMRdsYD4xjUwwgmLRowWDRfKbabBrbMcYRv+iOWI+/M8FPtf94eeki
         lDMA==
X-Forwarded-Encrypted: i=1; AJvYcCUmIo5jiQJxbEuYROkMKSIe2VB7IK5qQ3aaGn0+7QNQ2FQx0s8JcSMrudu2fo4OLyhsul4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWMsWewhyTuNPuaeqBgXYx+JIf0S4tg4QvPpm29BHBnR/k5JHG
	Q2ZHrxH9ugsieqa0NV1ISgLfLjE1yxfKCjZ0IDJ/AAXZjomSwf8qo9XV1YsOxKJHsxDsASuopfS
	wVV+PSPb2CF2hewd9WF8g1KoszVNGc/QL0yps5g==
X-Google-Smtp-Source: AGHT+IFZerPWDOgr4c1WuohxSQ3+JvT1ubVNndAVMth/RrtYH7UChyTMrjQo7sPYZVdcATBDZ05y/rcKJPj98SHVq10=
X-Received: by 2002:a05:6512:3088:b0:52c:9e82:a971 with SMTP id
 2adb3069b0e04-5343882d1ccmr6349398e87.7.1724662106426; Mon, 26 Aug 2024
 01:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240823105421.50017-1-shenlichuan@vivo.com>
In-Reply-To: <20240823105421.50017-1-shenlichuan@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2024 10:48:15 +0200
Message-ID: <CACRpkdb+kfRZE-tJWpxsmYFCzLhnJvCjVtmwrBCAFHbaXVFHXw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: freescale: imx-scmi: Use kmemdup_array
 instead of kmemdup for multiple allocation
To: Shen Lichuan <shenlichuan@vivo.com>
Cc: aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org, 
	ping.bai@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	opensource.kerenl@vivo.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 12:55=E2=80=AFPM Shen Lichuan <shenlichuan@vivo.com=
> wrote:

> Let the kmemdup_array() take care about multiplication
> and possible overflows.
>
> Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

Patch applied.

Yours,
Linus Walleij
