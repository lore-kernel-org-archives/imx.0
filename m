Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA356372685
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 15:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784732484; cv=pass; b=IJgg3RxWestGvO6uTWgbKrapgeQw0sLc8auLr9PaaJq/gMtJEahzVFeE/kdMPyc626Ict4GZemCxs2bqDOXUQIL44u1Zix4xJzWk9X/zJVMoe/amlpbozpbOaHCVtu7LCY1tqYLsTZ5vGGqd//k0/osBjl/IvimqID9EAXznkIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784732484; c=relaxed/simple;
	bh=VI4OwuFEOitISKsCf5TtIc8+gelg15Dp+6Rf9Tq1qX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MqpNu+cFjmpK3uZ/LZAVhwOkbsecmPNH4uzo6bP46Wb5na/youxEooXe77sonvyWuAF9WTBMnxQ78nhqQm9Af/tybklbCSA4Ai7TOMid5NeMBmuJgFH4Ss2OcCPMM2lwdr0uqtQPBRrc6UEDpa6iPnnZofS4poMBxMLvkHgsvSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m/OgcmjJ; arc=pass smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m/OgcmjJ"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-51c01c79467so1415821cf.0
        for <imx@lists.linux.dev>; Wed, 22 Jul 2026 08:01:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784732482; cv=none;
        d=google.com; s=arc-20260327;
        b=c+lEXDLhA0AH+fZqgYk6KQ1NyMj1GiAWBjc9ZO6I7wfY+g2/M8gUd5p82slX9OP58W
         +elZjNlhwh7nKFOL00SLi/OkIaTwxm1l3vZWKa1ULKvA7TGtCkhgNr1039rHWCYxjWXx
         5zoCDaxzJZdNBsYlwQ1v+ZYZM7cxC6tB8gHpkcj4WJBgLwrN9IW+96Rb1za5ympr94YG
         j2WgIxe7WbEflCf6lDdm4MowlLg+xaU6jW/8aSZFWbtDymhucNOqtMi4pVY5A97IlDJB
         it8T3yqhlEJEExeDDhHtjKkr62sbpFTswttxdmAGJXUw2pUVzipNadhEu03GVD0Vr1oN
         tnFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IUDdFmL3+NA+J1/tlIoHIkJZpryeycSZRENBb+lv4ow=;
        fh=XI6XeR6qLuviF7xXBKWYPqrUrDoRdxd7diKceeMT1vk=;
        b=aIMIFdZ2uj6avGl2GNR/4fz8xqzG8dsPEazxDe+hL/+17ypNUtM7D/7pj64CkHP+WE
         4CeCzJ1ifnaR14qoKHUoldmfRzl7q8nxD0bBaiVEOgRKDTt/mTmAxcDsae8SDwR3SjoJ
         bhN3l3dVtFXkgFHxUyLs8nqtra7zy82TnVtAWwJpEbpUtDAkM/wK/F796upGL/J60svi
         8iy9j1p/uQAE723DweG+1dWcvN5dgGohrPQllGNaBdQbdMhJ6Sx7Hb3B7tpfgs9U5j7I
         o7bxC5b+9llN2Vx649Kp70C0UpNgyIjtN8xs6PojVO1hwXSAiBMQFXp8j9D2aFBuGIKJ
         oM6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784732482; x=1785337282; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IUDdFmL3+NA+J1/tlIoHIkJZpryeycSZRENBb+lv4ow=;
        b=m/OgcmjJaUFF49Zo/Ih0sifXwPyAHCiacPyMPt6iMZQZYfrd3Yh1mlB8sxCoe9vQ/z
         fqQLq1Xe6UJQacZamWHFG5J4evTzZnFDsrwdrHdfX1dhvEVkngv/INrWOiBo1BwnHmwg
         1IqSr9m/oDpRza5vA8asd6c0fxCHim6qAgCZTEKup/SQpupFTp0EMqY0xhvZ6vs8KRpB
         oeFCXRqq4oct55TOQqJPQUKALSNK14dRnkM+8uuYAKRoBW4OkndtuY57k1eW/z/aQ8yt
         JzUryfxpI2PIcZLoNIHuyXvLJsqeN6sAhlqiPAm1fZRZxs4jO5cTMF7IKDIqqcrtjCcz
         KU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784732482; x=1785337282;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IUDdFmL3+NA+J1/tlIoHIkJZpryeycSZRENBb+lv4ow=;
        b=kKib8Or6lIMxPoTxS6p68hxVYoxSqhqRu06RijA/z8Yxa/zIkqj1jZoxPT/q9nQ1Sg
         DNqxDgCNQ3u4kwrmhXo9UMMhsk4FN+8sUVyR5j4IRSBL1uG1M2VQZOtIbpqS7ca7hU4O
         AGlsJZGsNtjpkD4c3xYkBIn2dc6OavLP7XQcUTBd24r3fo1yOmb3e1kGdoFWoFMAxo0E
         Z9TSYvNQvikZcfOF8Tv7Ooi4TMe/1j18VF9/Web1X59vZZ3yedl0y69n8j6mj3dMqWhV
         j3natVptdHLawtri0tj1JmtE86wEhJGFwhpbnhuZ7d5qIwqhkFmhfzxvVXUzmPbz6HIq
         dhcg==
X-Forwarded-Encrypted: i=1; AHgh+RpyEg2FbS/l7hCjJbXFwPWOc1wXZzvTAysT3iY3Gi6Kh8f9WLR3z3eMPS6y0IponjVLbns=@lists.linux.dev
X-Gm-Message-State: AOJu0YzSHu0QKRhZoFpbUo6/yXH9AjnqlWv7k15jh1lrYzPgltK4JVRs
	a0qgfX9LzVxMxo0WUdJT7jXzQ6tzoQQ9POZtnevZIx9UnkGev8ThwEf5KoEM9DPxCysX4nNjbcA
	9e9m/Jm966yJeORsyBnOGSKDhOLPKGE0sDCNNB55J
X-Gm-Gg: AR+sD12CQbrFavyXX1tjFcjIjmWYVKUTjS8gRExxXPrR+jurw52a1TBbIa14OdKI6sc
	BVxu3LlbxqWngZ9PRNDgO2kUGnKPA+nAZqruupNklyGHjlTUy71bQfPneZeZaiuNiLUMVp4glzv
	MNF0Y0P3lOctHx0amLAC/cOr5HN8OtFO6muvjM23io0JZLvzEQ1cLvWgXHgShoGC1sK603OROpf
	atEY0NKUX2o7J1MEbuw5zvaL1e+cudfG3rGpnhuXcnVbHj433fYk9gbfWYOt/j3lBmyxQ==
X-Received: by 2002:ac8:5fcc:0:b0:50f:b69a:f4a8 with SMTP id
 d75a77b69052e-527ef057dc5mr8866391cf.7.1784732480733; Wed, 22 Jul 2026
 08:01:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718111340.159896-1-linux@yoavmoshe.com> <CABCJKudqGL+BFFcz3qsuoJB6S_OAt-vs2yqePC_=oy+JzmPpVw@mail.gmail.com>
 <3046e60d-509f-471f-bd15-3ce78c87500b@yoavmoshe.com> <20260721180950.GA3684684@ax162>
 <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com>
In-Reply-To: <180001f5-bddd-4e58-8442-f7ef3c979500@yoavmoshe.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 22 Jul 2026 08:00:44 -0700
X-Gm-Features: AUfX_myRDvh7sB8bTl-K_5M53o7Jc2MxCOtToMgfXS4NBIZfb2fG6H4OMTOIhfE
Message-ID: <CABCJKufhvTxmVm8y7xr4RWWKsoZk0h8UGBnem+F5fknnimaqPA@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: imx: Fix suspend/resume crash with Clang CFI
To: "Yo'av Moshe" <linux@yoavmoshe.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Russell King <linux@armlinux.org.uk>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev, 
	stable@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 5:54=E2=80=AFAM Yo'av Moshe <linux@yoavmoshe.com> w=
rote:
>
> On 2026-07-21 8:09 PM, Nathan Chancellor wrote:
> > Does using SYM_TYPED_FUNC_START for imx6_suspend() make that work?
> > Something like this builds fine for me and I see
> > __kcfi_typeid_imx6_suspend generated by Clang.
> Hi Nathan,
>
> Thanks for the suggestion!
>
> Unfortunately my physical board died, so I couldn't test this on hardware=
.
> However, I gave your patch a try under QEMU emulation (with CONFIG_CFI=3D=
y
> and copying the 4-byte hash into OCRAM before fncpy), and it still
> triggered a CFI panic when suspending:
>
>     __und_svc_finish from imx6q_suspend_finish+0x78/0xd0
>
> It seems like the hash generated for assembly doesn't match what the C co=
de
> expects at the call site.

Are relocations applied to this code before the function is copied?
Because SYM_TYPED_FUNC_START doesn't embed the actual CFI hash in the
binary, just a reference to a symbol that contains the hash, and it
relies on the kernel to apply relocations before indirect calls are
made to the function.

Sami
