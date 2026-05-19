Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAA93DB31F
	for <imx@lists.linux.dev>; Tue, 19 May 2026 17:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779211212; cv=pass; b=mSELs1ug0GzLDY2U1Vlg3dQVbxMpfYWjaxTfJ5x8mIgcMJ9GxNRlMz4to8BMCblcNsSMiimYqThmODfEbA4+BCL9xAboYFL5/+3whiCTf7eb+adDediqgu95xFqMV4i4SgmuH7igpUaHNfeOJjgrI62HkhaHT2pNGmQWpuRaQ5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779211212; c=relaxed/simple;
	bh=2DLgzqZJ5p1ZCqGSn3kM25I7MJRT43xzHHQMKm+TPAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ug755lyy5NCiQrwuPAzi0sbUmyQ8HmzRNf/n0MS2zwwwybjfYiDWkIN2SkQCy7B4j8iU/tDEEgulMhWFHwlXwSfVtYnEnhaluOgpzwnKFwUhRTMbvFogaK6k0O33vAXscTtIHcsxNwbwl3j3FgMEh2tNsvikteUFoaJ7biGJtFQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lucQMGUw; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lucQMGUw"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ba180a022dso795ad.1
        for <imx@lists.linux.dev>; Tue, 19 May 2026 10:20:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779211210; cv=none;
        d=google.com; s=arc-20240605;
        b=FhRmakPP39sEWFlnFNovlicErZqXtTcy5tGZnWyNFBLdf0ud9WalDxptUHPKUokp4z
         iRTk2btzTbTnqeXjEgxbqAnwrCNHcYiv8R8Wv+aRVSlMg/uLYsuYMNrOBuKnuT9MkT0A
         I8xsvaDnJvDawcEMkri2JASHeQEHCMAgIVUkHfz1k08nvmLpVRyys2du7KZLEN/Qd+o7
         hn/nzU0aD9Wu/MpfJKuv4atv/s0NVe3759fjxmbTm8/RdFJsIOdOnH7jfkMlvY5NjVVK
         o17xDQOj332xliDR3VMlxAO4O6TM/LYl2IT+0XT2S0S69HwwQ9HDxvFM/rLysxSqpsjS
         /u5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=45VcAaAGxdINjsuoDSahDEmylTGz4VFthZK/dnu7mYc=;
        fh=B8+F8Ag5irYDLdOdkls2EJKTXbAmtu7qQJWvkpZ5jXA=;
        b=MOdWRVTfZgCG8dsFBxVAr0XPmd3RrcNT8+0oyT15fdUN6teqnnEIxAfdXlWyrC+mNH
         lMWIRLJ4oIGeP1jmWEp+LKAjgk1IQzjki9hDr2Kn+q70gSUtSWqXbrQQuRx6q9cBOaQs
         Oz3uLSPFZuXakIlJj54/pmuBUKQQ/Wje2KQ5q9HbWi7XB6lMufIcbPdkbGylA9igfDvq
         8//LO1n9Bb7OoFqGMMQXUULDGGLpjT1hvymd1qqVzq73FnY9ZoA6KukF6ZsTKlgPKTfx
         B29Tgj7S0T0ISayyOGVMWdjFnSOp9i/+cS3c6ECscuQIRVoyeTPbEdRzduwCpYitkh+K
         nJ1g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779211210; x=1779816010; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45VcAaAGxdINjsuoDSahDEmylTGz4VFthZK/dnu7mYc=;
        b=lucQMGUwVNru1ic1hPbGcHffjbeDJOPxEVP/hrOqeN3IlTSNqI5qOsyBvZ2hhpPoKj
         JeEira+QmazbIILKAI1oGIiDOQJ47zkd3sSzGElK9Sq5+X+qPL/QfWTh7r6KPCc26FiZ
         +Y/ACEJf280HfpFDIqr+TmxeO8VMgqL55mDyhnoaS1lJ0BA5lYILvESC5X9hiF0k6Gbo
         PozlAA5ZcnJWRcXwym7+UtCuwLJ6eJVtRjS4HUijNpj95RxIk1kEuDyAsUOlNUd7iCZx
         1PzuhG53tO2/7FuM32Ne6+T80pu/7pNVkZB0zd1t3ohJw/YagwUGzhDVOb1mdBZIwVc+
         U2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779211210; x=1779816010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=45VcAaAGxdINjsuoDSahDEmylTGz4VFthZK/dnu7mYc=;
        b=Vsm3bhlXvzAx+rnNNyizpLQ3wUVKuQE6TDlunHGNR81HB6zeiefUo8VT0KyTUia4K1
         +AScpvLXSpByN3jdZXmkot8F1wK+hyj1RmvYCKoJGkyRU2OREQjQrzrQ4Urkt8OmF8wy
         AjcXm417BqPbVhUcHVZWHUJSTomCgFlD0Kk17x3cdGKS4Sa1jFUMyb3uWWA0/+3/SRic
         F5i0vHvd6xIwX4Zw8UibbdGyBjecHQ7T8f4zsZy7rGlqrxwcd/d8HAKQnr3dWMHZ2zzt
         8mnCX5bKtioCMSGxcaHvBtfM3kdHqgaTJ2zEHHxi1N4bZXCQHrzEOf1mru+yldiW78HX
         tPvg==
X-Forwarded-Encrypted: i=1; AFNElJ+paKkUZWUCaP0/3wx6tN/tLBiuXc4XfQG3Q6DWVqhuYir1Ri+MhFuo8knEhJhJSdWOLWY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzzzBFxWL9TenIlWO7uT7NLnjwycHIAFwuHqLyD9gOGsA1i7w0e
	/TVrIRwJ2BXZWFP4ntHR4ttGgU6W78UY2M+7AwY/YTAXb/aMcRuL6im0+rMu1/bK6u3FgbHbKsx
	AIlLyUASUXE/FgRRCB6X+xxgfeNM+rkSdVd3uNMDh
X-Gm-Gg: Acq92OG618FiFWBWsJF4etvpgTHxh03VSQ/96qa3vCqZLzjb3uMdBRyWRrFeGObjcK4
	nQwZ9+UvT6tqi7x0WF3KxkY8g6ri1a4GtP9qMHyzKxE1xfdNjTf6AJapDGydMnAVLPqexFyCCUV
	jBv/Ey5W96TgMSq10hUf11kaWjzNFBYZ0quCLCJN7xmiyTnE6Sx/3gW/OPQKP3G6OCSZ4YboeKL
	w0s9I8lvMTdkOeiiGR/wU4aVWDTduojUFMFvjmReyyBEuY9lcK/8++0JpTpO293jD7Cz7mDgyQ0
	+QUkmZsykY/sOLcPq2RalZRoSCIK5ixHaXdwkYdIOTliCqwDWZdq2uD6OvoXvPgMl+/Wq4sHpZd
	o/Zk3OrgMUdvadS+n
X-Received: by 2002:a17:902:ce85:b0:2a9:5ef5:399b with SMTP id
 d9443c01a7336-2bdb32bcb70mr6690835ad.19.1779211209697; Tue, 19 May 2026
 10:20:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260513103021.2190593-1-wei.fang@nxp.com>
In-Reply-To: <20260513103021.2190593-1-wei.fang@nxp.com>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Tue, 19 May 2026 10:19:58 -0700
X-Gm-Features: AVHnY4JTHToihTdtG56Fn2wMZ0yfZJeikVG9It8zZEUo1xg0jYg1dgfIyUDllE0
Message-ID: <CAEAWyHeTZJ+=QAbPGfvefwcSJfVCAw=w2P70xytxqBOScvb19w@mail.gmail.com>
Subject: Re: [PATCH net 0/6] net: enetc: SR-IOV robustness and security fixes
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, imx@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	catalin.horghidan@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 13, 2026 at 4:02=E2=80=AFAM Wei Fang <wei.fang@nxp.com> wrote:
>
> This series hardens the ENETC PF driver's SR-IOV implementation by
> fixing multiple security and stability issues in the VF-to-PF mailbox
> communication path, identified through code review.
>
> Issues addressed:
>   - Missing input validation for VF requests (security)
>   - Race conditions in VF state management (stability)
>   - Initialization ordering bugs (reliability)
>   - Resource cleanup issues (memory safety)
>   - Missing ratelimiting in error paths (DoS prevention)
>
> All issues are theoretical (found through static analysis) but represent
> real vulnerabilities exploitable by malicious guests or buggy VF drivers.
>
> Wei Fang (6):
>   net: enetc: validate VF primary MAC address before configuration
>   net: enetc: fix race condition in VF MAC address configuration
>   net: enetc: fix use-after-free in mailbox cleanup on interrupt race
>   net: enetc: avoid VF->PF mailbox timeout during SR-IOV teardown
>   net: enetc: fix initialization order to prevent use of uninitialized
>     resources
>   net: enetc: add ratelimiting to VF mailbox error messages

Series LGTM. If the commit message for patch 8 is updated, feel free to add=
:

Reviewed-by: Harshitha Ramamurthy <hramamurthy@google.com>

>
>  .../net/ethernet/freescale/enetc/enetc_msg.c  | 34 +++++++++----------
>  .../net/ethernet/freescale/enetc/enetc_pf.c   | 28 ++++++++++++---
>  .../net/ethernet/freescale/enetc/enetc_pf.h   |  1 +
>  3 files changed, 40 insertions(+), 23 deletions(-)
>
> --
> 2.34.1
>
>
