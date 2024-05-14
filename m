Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9382254903
	for <imx@lists.linux.dev>; Tue, 14 May 2024 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715684595; cv=none; b=KCNGEg6h/VMqmbxerUFZWCThTRY5q7y5jBKnJSCh7eHjuVdA0YuVCEgBN+vGcZrHihI4aB/bQmVuRU1gvyJWrPQh5zOWjj+N+QdyGJ8qz9jVpQJvso+qjRUEEhmVXM9k5OTWKxDJgIbLWvNFRdKGA8OdrPXdsftMOudB1E+YwpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715684595; c=relaxed/simple;
	bh=qvtbJQjztyVh/QhT8JUKCEnHnGv7yH0tK6s8pZs9Ufk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PxgCMb9s7yJul7reQ6eWRwZnRDZTV/IdboHNQA0CfcoyTQVfAZO/0TS92Y3ru6/Wkf8c/RTbxRZ4j5sp7pReYEZz+aqw9F+CpwZKuVGtxwxfmLEV0GEZHkWWk6T1K//77xxmBn3YvCnLsYNVK7B6cAL2/neYGsOTZ3FSnC90BdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HcH+hk8p; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HcH+hk8p"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2b432ae7dabso1430861a91.0
        for <imx@lists.linux.dev>; Tue, 14 May 2024 04:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715684594; x=1716289394; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvtbJQjztyVh/QhT8JUKCEnHnGv7yH0tK6s8pZs9Ufk=;
        b=HcH+hk8prOJZ7aiM7xMzg1A/jQMOz7yjeX+Zs4/UivQeYtnAEsVsukAlWDVGLHSjFl
         ZqG3h9ck7En0VWA4fMEtfeZwYQwb8xPhiuoD3Rebb9RHPRJ+Ou6PIZu+8klj2iiCVuJL
         BLCndS5XOedfjv5nfiSqtQB1lmBpmT8Wuw/NmsiIIoTJdkBNXqfGLqjPOFKoKzzVlMvQ
         ZOxmpcHSOhCEaVq7TUknim9bHOg3rtHiG34CnfTnU2Q00C1zBmZoa23KaMShhL9rFJVQ
         vk3GLAQU8haH+fCcpnm0cFRqFYfz8kmgfckWDMptzDxJE8kaHZxC3xCO5amfdtvoAkcL
         n94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715684594; x=1716289394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvtbJQjztyVh/QhT8JUKCEnHnGv7yH0tK6s8pZs9Ufk=;
        b=vFqA8M1bCYKbGyQEmGTj5AvtpmyqICn7CRqX6G2gv1x+YypFVLQKqm4bfkUg5Zikl5
         eiYu4EjZXMUpEDQnStyKVvFyOHJ7Jg/wFwVrzgA+IX/kqLWHU4411D8g/AZRC0A7KucT
         yxwvbrOw/j7JtgaOu975+emEWe+2dg+sYTh1r27j5xup2bVpGzVuw4416L2hBRCxF0JG
         uzHEKduCTLqoufp+z/9GFCfVnxsQNjENno9q0XG34oMFm+7tOkq9jV/PFv6Yq9QB2Jag
         HB/x2YUqw0VvBvoTMuyRwqfLsVs/oulJe1Modq5mz3Ck3Y9p7lh51VQAh2mzhvdy/Uts
         KtSg==
X-Forwarded-Encrypted: i=1; AJvYcCWKdHUAMDKpataxZputUvvBvxO4Yaod6C+0ONx/xkYBacw3PPeVuSL/jTyNr1A3ATg4YWHDyiZdeyfgUFxC+tMF0z9L
X-Gm-Message-State: AOJu0Yzuj6GEp9YjNOk38uFEygbYhRnnMwxRLO+AxktV8RnEkGjXJ31G
	vqf0nEBCako3hxSpcqcSONbakK90VX6D8I8yokA03e+RFLE90JvmjlYtkCDPFGaMBtU6WtIaG8R
	vPOrpsruz7jonL4NgQBGUensr820=
X-Google-Smtp-Source: AGHT+IHs7Vqd+NTm8xiwUq40GqaUs9bWvX+6Jjl9d5S6GHmr6x10T/FHBCcpwFqSWyY+5nVWQoWBmchP8zTMqMfYpwI=
X-Received: by 2002:a17:90b:2292:b0:2b2:b080:dd35 with SMTP id
 98e67ed59e1d1-2b6cb6c8136mr11450752a91.0.1715684593715; Tue, 14 May 2024
 04:03:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1715666198-9140-1-git-send-email-hongxing.zhu@nxp.com>
In-Reply-To: <1715666198-9140-1-git-send-email-hongxing.zhu@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 14 May 2024 08:03:02 -0300
Message-ID: <CAOMZO5Az++MyYyi6zJbut+iQheSZygZA2YqNGqAjxgjO+_QYeg@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: dwc: Fix suspend hang when e1000e network card is connected
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 3:16=E2=80=AFAM Richard Zhu <hongxing.zhu@nxp.com> =
wrote:
>
> In dw_pcie_suspend_noirq() and after the PME_TURN_OFF messgage is sent ou=
t,
> one PMC version2.0 endpoint device E1000E network card hangs in LTSSM sta=
t
> polling and L2 stat check.
>
> To avoid this hang issue after the PME_TURN_OFF message is sent out.
> Only poll and check LTSSM L2 stat if the EP's PMC version is 3 or later,
>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Fixes tag?
