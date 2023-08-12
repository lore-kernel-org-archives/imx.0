Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190E71849
	for <imx@lists.linux.dev>; Sat, 12 Aug 2023 04:54:48 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5236c9ff275so3456286a12.1
        for <imx@lists.linux.dev>; Fri, 11 Aug 2023 21:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691816087; x=1692420887;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l3ddeUjL7SIE4Povb1Oebh9C5DazjwghCO4yIf0VRQI=;
        b=E8bNguwuPEryFdsR/K1vou7w72Lo4nweCyDQQHYgazF/p79ifWf5UKPNKfSW+FCfK3
         jf68HYVBaCGvqfXl7p0ENsr0UCo18crw1hDcKXdKeodRe6Iyk3/ILRm8S9i/wP/toT2M
         f9CGPNSM8DLuuWDAyLPFnPH0aPxdYyOYFGxZynUfs47oL2gSLQOO4zJEEvdI4Y4sFSgr
         zUrqppUUiY3tSx+iL5BccZZ4jNuE6qpiI4Sm++omnYbw3hoRbklAoB3NfWI1qqXCfNdH
         GedUNaNE4fawbCxPthOX98iHJ7HpUtgLUHP7OE3sx/USNgD0AoHYrt3dUS8Ef8d8SpsT
         sQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691816087; x=1692420887;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l3ddeUjL7SIE4Povb1Oebh9C5DazjwghCO4yIf0VRQI=;
        b=BERhP2fNT14uSZc8BUWSsHUS1Qxl/+q645iYm29Xy4GdL4rUmNuP+Pvmy7vzCH5mdq
         +27rgkbDK24EgqRsmekZh2kqDC33KeeC9RKWzVXkJhZiLXDTY8C/qONAkKK3OsXEpthY
         bAXeR/5BCK9g3KqcagRKpPvofan1opZoSXaWnj49kyxdfuqf7A7SdICNyCG3fU/iSNLU
         rNDu4GyUWQFsPBrp8ZUfnwvMxd/7PqNFhjbwsp1GC4muL8NMuEu65kXKEwynuAzYqWuT
         QIBHiblPchNrm+GqKtfoSPBvnibQkxaczbahqVm79ajF/BdyyG/yEXrGnc2Y1yTCiR92
         dOPA==
X-Gm-Message-State: AOJu0Yz8OklUmwwgMGHovEToySszenqpIGjaZ2GUNmYgrUVRnGZ7n52+
	2VkLsWyWsm9j/1Ah5hwN7IaXz9NCg7SzXDVfM+HpikB98H8=
X-Google-Smtp-Source: AGHT+IGvZ4WXZT0h7TfoZ1mAMRFQgTHbAXqxY1Vp3K8hGj7cAMpkUtNTxkeW7mYEzdYyDY5WmJA1TOKzkw/bMlQLukc=
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a17:906:3114:b0:965:fb87:4215 with SMTP id
 20-20020a170906311400b00965fb874215mr3055738ejx.15.1691816086991; Fri, 11 Aug
 2023 21:54:46 -0700 (PDT)
Received: from 170827741999 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 11 Aug 2023 21:54:46 -0700
In-Reply-To: <CACRdBt-5L+r88m2nGdKFo+zk8H0VKT67UKSATtO1FK2OZsyywg@mail.gmail.com>
References: <CACRdBt-5L+r88m2nGdKFo+zk8H0VKT67UKSATtO1FK2OZsyywg@mail.gmail.com>
From: harrynicomama@gmail.com
Date: Fri, 11 Aug 2023 21:54:46 -0700
Message-ID: <CAC5d1WJESU85SQSMSHfWBEJ=XeWGsP_vNjEYW0UkEiVBN_ptjg@mail.gmail.com>
Subject: Quick Reply Extension Testing
To: extensiontest66@gmail.com
Cc: imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

> Browser extension test thread for quick email replies.
>
> Please Ignore.

Testing async functions.
