Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD683769E9
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 10:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357550; cv=pass; b=N3/8jFIesmyQ9gdKa/YKYy+BUiDdxdRu3nQj9s3b5qQaHGz8rKa1HPUpfbZsbv5njbXvA5G+WGWMn0V/tFqBj/CMQZqOs24GBNthRL+oIr2rWygIG/TpLmMgRyWUtcLTJ2VFaSQFT4l1+AIcwTbvj5G+ww5FbkExAExwPE7Houw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357550; c=relaxed/simple;
	bh=+wQ1/0Ny1GWvfbtUqTtYvQWbT0Ovv2Co+yvv4LxBCis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qHFkoup6Kk5YuwNWiLDCcf91EGZntBIuBiWyxnltZIW5WED2Psmky9D/xgDFY+UW8UdjhibE1VEScoegcIIMRK3RfSfpluOZBSIO306jDYmIGjw0t2lxdKs3UUK5heEPQ5NiTqtMIBMTCrHaOj/81CJTRH2VyrZMopDqDcPGJ0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRlWSVOq; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRlWSVOq"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc891373e0so18399555ad.2
        for <imx@lists.linux.dev>; Mon, 10 Aug 2026 03:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786357548; cv=none;
        d=google.com; s=arc-20260327;
        b=fPtt1yn9K136AL9GJscCNHz++j49eNQrhA7+XViT15QWJpu4EqdMSHH1KEA2YTyCxP
         CRNM5dd69xve4SVkm3gWsvl24Tgeges8yGfRkvzdvvJ5efwJvuaM/pTpybiZsA0vHMe6
         XBftUDHFvERAQ/gR1pGXODprnvVHEsnwQr4Rc+0GHUfJ4Y6oML3b4xHZn42pA1MM+amK
         x2Gf8SwO/W5fENW8TnYIsQCAMIsQ5XKQfF2R2SPqRww6vH2mFnSYd0gWXpOXIWCvEOfo
         PCSqLEVzNSqeD3GYnOBWdCvyZG/dbt7EBWTEmrg6qgvN6pwn2fTSj+xA9rntAwIzJJ+g
         KT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fMsszLrae2MK8L8AhSiRXxABl30KILb8MFS1COTcPW8=;
        fh=WgO7FgHyZez+HsAGmm+9JU5+WWOBhbMgWjs6Vera3lk=;
        b=Spn7xAYCNy498DZyAHO6nLZoBbWsJOkSu4J10pEKb+u3Qp8Lf30s0YQ3cD21tklynf
         qWuyOUC2kgy0frCRu4ClRCPrZf7MXvj3MvX46iATrgb+HsuFjVR0fiSHruZvxMSjdjRK
         Xyi7R40jaoaEz2vL2lVk5GZ17XzCrTzyfdfUEeDrvWwoJjZ1vXtDdI8EFKLXE4dYF5z+
         TOHfvK3fvD78GVPWaIZBfTv51hPOwyjkuIq8v+sqgYg6S21fHbsqyB8cgbqYYsi+GiP6
         M3IgIYZIPN4tbBEI1F6N71lCCV38Vait/qzJ/Ooo1Vz8rO7dmE7hOahJ0Ebnd+9qMMd7
         SYNA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786357548; x=1786962348; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fMsszLrae2MK8L8AhSiRXxABl30KILb8MFS1COTcPW8=;
        b=nRlWSVOq2b1aotXlit0fgxxhdX7wv9jDJ1XyERB49HAjh1rGFRWj8uk4zV7eCwmjaT
         iGnxTMrEOY3SSfPkbALkMKX+FDQwmwJkgX6vgBHsGi+n1hkciRtRunkUJrEXEPGCsJPS
         xi0ClsPnPV5V/gBki9h/bzbRrnuuOh7oAAwQ+k3IdBzKY45C3m9gGaBl994IHnPJOde8
         kEvf97RgD+d/s4HV4+dHBVTf5SrPe1A7raEcM7G4rh1z8pKYkLeBB/xLNGJN5dFqf1K2
         hePZsiMhTw5wllUfo+ATX/fjnaE/NCOD9lklBMySyWtYr0uzLMHpyRZGeQ+372noMvFs
         GWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786357548; x=1786962348;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fMsszLrae2MK8L8AhSiRXxABl30KILb8MFS1COTcPW8=;
        b=Pozbzdo/2PC9+qrBlFuijMNWEWGR2pQlQdwXMew1hyVk7+WjUaUAuds6ClDrnC+mr1
         KtCc/N5tdbQ7YtZOSxlPl5L0WtPSifnbuCw8RgxkEcP2pW+XazvNj4GwG3+Wvymj5oOw
         ooegf7bmLcD26aGIf8B8BLCLxImgX4q7Q6LpxeuAdQzdPMOp71IYfAXsD7lt/uiNJ0oP
         y0obgtnMGE0tvSH2UuA2I2fqQlaxEmDW1004DsxXQx/4B+22D9SaWaoryEqcNdufpENQ
         XvSx6ir8jaPXlCYE3Yd7GQt1uNjdY08MM6RhpmulEOw0zpCkxa+KwfBsyWII+ywtUYQG
         1qZQ==
X-Forwarded-Encrypted: i=1; AHgh+RrFn8Jgyf2ytGymoPFf3GEgOEgDqv5t69zSXno/jCvsQLjiwVu0+m9DisDjChkaXYdEfFU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCUJxHoUOyhxycheywz3iRzhkUECdvdXI1k3w5miO/HNy0DUz/
	fGWkaxpqHGwaxQIyQYoFxrp8U1tbdlgEZb5X3NKcl8yYd9UOtbu67QL/LDKS/vQFmOQTsGgQ3xv
	InwpEms3kvqPCSCDP2XU/6WjeZFSLwFM=
X-Gm-Gg: AR+sD12V9dRxFpT2qLvmypL49jN1Aaz984u4Dwy+0E+iKkP39Eu0Z7Oi1mFSsbCwK4f
	b1zGwP53kDIg71/Yq1wFvqjO/yr8Nk5tdo0bzLikpcLqhj1NOR13IrS9ecSWuoNoT+FuGDzZS5v
	IBjfXj6SW3kfzJX3gyNejOlSZY/VOHWgN9RvSHAeeqzhtWujOp3Mf2dBQdm9C/cejnjW9QaELPo
	iTWAzCxTI6O8DjnGiuXiKcitVaHrKKFe6UcVky3hmsDRAN262Odb5YzHAhx6fnGHqXVB/g89sEm
	0Yy64c5yi/JgffOfa+wQ2mJLwLWOMFfEuhJZRZu9j3BS1kfPBWqn3To10fV5YyFArqvtTqzRCu2
	xIgAs5flC6rQ0+HaTeQqMlOhErd7IO9FWyGq3sO6zqOHY+iIF58+cTbUT
X-Received: by 2002:a05:6a21:9106:b0:3c3:8651:b302 with SMTP id
 adf61e73a8af0-3cc1a372bfemr862555637.28.1786357547968; Mon, 10 Aug 2026
 03:25:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260810093112.47807-1-phucduc.bui@gmail.com> <20260810094626.DA02F1F00A3A@smtp.kernel.org>
In-Reply-To: <20260810094626.DA02F1F00A3A@smtp.kernel.org>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 10 Aug 2026 17:25:36 +0700
X-Gm-Features: AUfX_mxcyOkzFIt26apNzc3AQVC2pMBeVC3PSTmwWCNqFnynRLRcPTYJic0izHU
Message-ID: <CAABR9nH3qTfRbsT2aE228M-koP0mNdmHy48ti1-xSkKHQcC7pw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] usb: chipidea: ci_hdrc_imx: Propagate errors from
 optional IRQ lookup
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> [Severity: High]
> This is a pre-existing issue, but missing an assignment to ret here causes
> the probe to falsely succeed:
>
> drivers/usb/chipidea/ci_hdrc_imx.c:ci_hdrc_imx_probe() {
>     ...
>         if (data->wakeup_irq > 0) {
>                 irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
>                 if (!irq_name) {
>                         dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
>                         goto err_clk;
>                 }
>     ...
> }
>
> Because dev_err_probe() is called but its return value is not assigned to
> ret, and ret is 0 at this point, the probe function incorrectly returns 0
> (success) despite the memory allocation failure.
>
> Does this code need to assign the error to ret before jumping to err_clk?

This issue has been addressed in patch 2:
[PATCH v3 2/2] usb: chipidea: ci_hdrc_imx: Fix error handling when
creating IRQ name
